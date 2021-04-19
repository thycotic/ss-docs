[title]: # (REST API Perl Script Examples)
[tags]: # (REST API,API,Scripting,Perl,examples)
[priority]: # (1000)

# REST API Perl Scripts

Secret Server web services can be called using scripts. This example demonstrates how to authenticate and retrieve a Secret programmatically in Perl. If connecting to an Installed instance, change the URL to match your site and specify the application name if configured.

This example runs using standard Perl modules and Strawberry Perl v5.24.1.1. 

You may need to install REST::Client from CPAN which can be done by running:

`cpanm REST::Client`

This module makes interacting with REST-ful APIs much easier.

The TSS script below leverages the API created in the TSS with .pm extension file. 

The TokenResponse with .pm extension file defines an object that stores the authentication credentials for the session. 

The ErrorResponse with .pm extension file defines an object that stores error information should a REST request fail. 

The SecretModel with .pm extension file defines an object that stores the Secret information when requesting a particular Secret from the REST API.

TSS.pl:

~~~~
use REST::Client;
use JSON;

use TSS;

# Enter your Secret Server web site here.
my $host = 'http://localhost';;

# Enter the application name, should it be defined.
my $applicationPath = '/secretserver';

my $false = 0;
my $true = 1;
my $usingSelfSignedCertificate = $true;

if ($usingSelfSignedCertificate) {
    # Disable hostname validation since this will fail with self-singed certs.
    $ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = $false;
}

# Initialize the TSS Perl API with the connection information provided above.
my $tss = TSS->new(
		secretServerUrl => $host,
		applicationPath => $applicationPath
	);

print "Username: ";
my $input = <STDIN>;
chomp $input;
my $username = $input;

print "Password: ";
$input = <STDIN>;
chomp $input;
my $password = $input;

# Authenticate to Secret Server
my $response = $tss->getToken($username, $password);
if (ref $response eq 'ErrorResponse') {
	$tss->handleError($response);
	exit();
}

# Persist the API token in our TSS API session.
$tss->tokenResponse($response);

$password = undef;

print "Secret ID to retrieve: ";
$input = <STDIN>;
chomp $input;
my $secretId = $input;

# Retrieve a Secret from Secret Server by Secret ID.
$response = $tss->getSecret($secretId);
if (ref $response eq 'ErrorResponse') {
	$tss->handleError($response);
	exit();
}

# Read the SecretModel object
print 'Secret ' . $response->id . ' retrieved successfully. Secret name: ' . $response->name . "\r\n";

~~~~

TSS.pm:

~~~~

package TSS;

use REST::Client;
use JSON;

use TokenResponse;
use ErrorResponse;
use SecretModel;

use strict;

sub new {
	my($class, %args) = @_;

    my $self = {
    	client => REST::Client->new(),
    	secretServerUrl => undef,
    	applicationPath => undef,
    	tokenResponse => undef,
    	%args
    };
    bless $self, $class;

    $self->client->setHost($self->secretServerUrl);

    return($self);
}

sub client {
	my $self = shift;
	return $self->{client};
}

sub secretServerUrl {
	my $self = shift;
	return $self->{secretServerUrl};
}

sub applicationPath {
	my $self = shift;
	return $self->{applicationPath};
}

# Getter and setter so that API tokens can be reused through a session.
sub tokenResponse {
	my $self = shift;
	my $tokenResponse = shift;

	if ($tokenResponse ne undef) {
		$self->{tokenResponse} = $tokenResponse;
		return $tokenResponse;
	}

	return $self->{tokenResponse};
}

# Crafts a HTTP header for providing authentication to Secret Server.
sub getHeaders {
	my $self = shift;

	my $headers = {
		Accept => 'application/json',
		Authorization => 'Bearer ' . $self->tokenResponse->access_token 
	};

	return $headers;
}

sub handleError {
	my $self = shift;
	my $errorResponse = shift;

	print 'ERROR|' . $errorResponse->message . ' (Error Code: ' . $errorResponse->errorCode . ')' . "\r\n";
}

# Authenticates to Secret Server by POST'ing a Form URL Encoded content body containing sensitive credentials.
sub getToken {
	my $self = shift;
	my $username = shift;
	my $password = shift;

	my $postParams = $self->client->buildQuery([
			username => $username,
			password => $password,
			grant_type => "password"
		]);

	my $response = $self->client->POST($self->applicationPath . '/oauth2/token', substr($postParams, 1), {'Content-Type' => 'application/x-www-form-urlencoded'});
	
    if ($self->client->responseCode() ne 200) { 
        my $errorResponse = ErrorResponse->new(
                errorCode => $self->client->responseCode(), 
                message => "Unable to get token." 
            ); 
        
        return $errorResponse;
    }

    my $responseJson = from_json($response->responseContent);

	if (exists $responseJson->{'errorCode'}) {
		my $errorResponse = ErrorResponse->new(
				errorCode => $responseJson->{'errorCode'},
				message => $responseJson->{'message'}
			);

		return $errorResponse;
	}

	my $tokenResponse = TokenResponse->new(
			access_token => $responseJson->{'access_token'},
			token_type => $responseJson->{'token_type'},
			expires_in => $responseJson->{'expires_in'}
		);

	return $tokenResponse;
}

# Gets a Secret from Secret Server by GET'ing a specified Secret by ID and passing an authentication header containing our API token.
sub getSecret {
	my $self = shift;
	my @params = @_;
	my $secretId = $params[0];

	my $headers = $self->getHeaders();

	$self->client->GET($self->applicationPath . '/api/v1/secrets/' . $secretId, $headers);
    my $responseJson = from_json($self->client->responseContent());

	if (exists $responseJson->{'errorCode'}) {
		my $errorResponse = ErrorResponse->new(
				errorCode => $responseJson->{'errorCode'},
				message => $responseJson->{'message'}
			);

		return $errorResponse;
	}

	my $secretModel = SecretModel->new(
			id => $responseJson->{'id'},
			name => $responseJson->{'name'},
			secretTemplateId => $responseJson->{'secretTemplateId'},
			folderId => $responseJson->{'folderId'},
			active => $responseJson->{'active'},
			items => $responseJson->{'items'},
			launcherConnectAsSecretId => $responseJson->{'launcherConnectAsSecretId'},
			checkOutMinutesRemaining => $responseJson->{'checkOutMinutesRemaining'},
			checkedOut => $responseJson->{'checkedOut'},
			checkOutUserDisplayName => $responseJson->{'checkOutUserDisplayName'},
			checkOutUserId => $responseJson->{'checkOutUserId'},
			isRestricted => $responseJson->{'isRestricted'},
			isOutOfSync => $responseJson->{'isOutOfSync'},
			outOfSyncReason => $responseJson->{'outOfSyncReason'},
			autoChangeEnabled => $responseJson->{'autoChangeEnabled'},
			autoChangeNextPassword => $responseJson->{'autoChangeNextPassword'},
			requiresApprovalForAccess => $responseJson->{'requiresApprovalForAccess'},
			requiresComment => $responseJson->{'requiresComment'},
			checkOutEnabled => $responseJson->{'checkOutEnabled'},
			checkOutIntervalMinutes => $responseJson->{'checkOutIntervalMinutes'},
			checkOutChangePasswordEnabled => $responseJson->{'checkOutChangePasswordEnabled'},
			proxyEnabled => $responseJson->{'proxyEnabled'},
			sessionRecordingEnabled => $responseJson->{'sessionRecordingEnabled'},
			restrictSshCommands => $responseJson->{'restrictSshCommands'},
			allowOwnersUnrestrictedSshCommands => $responseJson->{'allowOwnersUnrestrictedSshCommands'},
			isDoubleLock => $responseJson->{'isDoubleLock'},
			doubleLockId => $responseJson->{'doubleLockId'},
			enableInheritPermissions => $responseJson->{'enableInheritPermissions'},
			passwordTypeWebScriptId => $responseJson->{'passwordTypeWebScriptId'},
			siteId => $responseJson->{'siteId'},
			enableInheritSecretPolicy => $responseJson->{'enableInheritSecretPolicy'},
			secretPolicyId => $responseJson->{'secretPolicyId'},
			lastHeartBeatStatus => $responseJson->{'lastHeartBeatStatus'},
			lastHeartBeatCheck => $responseJson->{'lastHeartBeatCheck'},
			failedPasswordChangeAttempts => $responseJson->{'failedPasswordChangeAttempts'},
			lastPasswordChangeAttempt => $responseJson->{'lastPasswordChangeAttempt'},
			secretTemplateName => $responseJson->{'secretTemplateName'},
			responseCodes => $responseJson->{'responseCodes'}
		);

	return $secretModel;
}

1;

~~~~

TokenResponse.pm:

~~~~

package TokenResponse;

use warnings;
use strict;

sub new {
	my $class = shift;
	my %options = @_;

	my $self = {
		access_token => undef,
		token_type => undef,
		expires_in => undef,
		%options
	};
	bless $self, $class;
	
	return $self;
}

sub access_token {
	my $self = shift;
	return $self->{access_token};
}

sub token_type {
	my $self = shift;
	return $self->{token_type};
}

sub expires_in {
	my $self = shift;
	return $self->{expires_in};
}

1;

~~~~

ErrorResponse.pm:

~~~~
package ErrorResponse;

use warnings;
use strict;

sub new {
	my $class = shift;
	my %options = @_;

	my $self = {
		errorCode => undef,
		message =>  undef,
		%options
	};
	bless $self, $class;
	
	return $self;
}

sub errorCode {
	my $self = shift;
	return $self->{errorCode};
}

sub message {
	my $self = shift;
	return $self->{message};
}

1;

~~~~

SecretModel.pm:

~~~~

package SecretModel;

use warnings;
use strict;

sub new {
	my $class = shift;
	my %options = @_;

	my $self = {
		id => undef,
		name => undef,
		secretTemplateId => undef,
		folderId => undef,
		active => undef,
		items => undef,
		launcherConnectAsSecretId => undef,
		checkOutMinutesRemaining => undef,
		checkedOut => undef,
		checkOutUserDisplayName => undef,
		checkOutUserId => undef,
		isRestricted => undef,
		isOutOfSync => undef,
		outOfSyncReason => undef,
		autoChangeEnabled => undef,
		autoChangeNextPassword => undef,
		requiresApprovalForAccess => undef,
		requiresComment => undef,
		checkOutEnabled => undef,
		checkOutIntervalMinutes => undef,
		checkOutChangePasswordEnabled => undef,
		proxyEnabled => undef,
		sessionRecordingEnabled => undef,
		restrictSshCommands => undef,
		allowOwnersUnrestrictedSshCommands => undef,
		isDoubleLock => undef,
		doubleLockId => undef,
		enableInheritPermissions => undef,
		passwordTypeWebScriptId => undef,
		siteId => undef,
		enableInheritSecretPolicy => undef,
		secretPolicyId => undef,
		lastHeartBeatStatus => undef,
		lastHeartBeatCheck => undef,
		failedPasswordChangeAttempts => undef,
		lastPasswordChangeAttempt => undef,
		secretTemplateName => undef,
		responseCodes => undef,
		%options
	};
	bless $self, $class;
	
	return $self;
}

sub id {
  my $self = shift;
  return $self->{id};
}

sub name {
  my $self = shift;
  return $self->{name};
}

sub secretTemplateId {
  my $self = shift;
  return $self->{secretTemplateId};
}

sub folderId {
  my $self = shift;
  return $self->{folderId};
}

sub active {
  my $self = shift;
  return $self->{active};
}

sub items {
  my $self = shift;
  return $self->{items};
}

sub launcherConnectAsSecretId {
  my $self = shift;
  return $self->{launcherConnectAsSecretId};
}

sub checkOutMinutesRemaining {
  my $self = shift;
  return $self->{checkOutMinutesRemaining};
}

sub checkedOut {
  my $self = shift;
  return $self->{checkedOut};
}

sub checkOutUserDisplayName {
  my $self = shift;
  return $self->{checkOutUserDisplayName};
}

sub checkOutUserId {
  my $self = shift;
  return $self->{checkOutUserId};
}

sub isRestricted {
  my $self = shift;
  return $self->{isRestricted};
}

sub isOutOfSync {
  my $self = shift;
  return $self->{isOutOfSync};
}

sub outOfSyncReason {
  my $self = shift;
  return $self->{outOfSyncReason};
}

sub autoChangeEnabled {
  my $self = shift;
  return $self->{autoChangeEnabled};
}

sub autoChangeNextPassword {
  my $self = shift;
  return $self->{autoChangeNextPassword};
}

sub requiresApprovalForAccess {
  my $self = shift;
  return $self->{requiresApprovalForAccess};
}

sub requiresComment {
  my $self = shift;
  return $self->{requiresComment};
}

sub checkOutEnabled {
  my $self = shift;
  return $self->{checkOutEnabled};
}

sub checkOutIntervalMinutes {
  my $self = shift;
  return $self->{checkOutIntervalMinutes};
}

sub checkOutChangePasswordEnabled {
  my $self = shift;
  return $self->{checkOutChangePasswordEnabled};
}

sub proxyEnabled {
  my $self = shift;
  return $self->{proxyEnabled};
}

sub sessionRecordingEnabled {
  my $self = shift;
  return $self->{sessionRecordingEnabled};
}

sub restrictSshCommands {
  my $self = shift;
  return $self->{restrictSshCommands};
}

sub allowOwnersUnrestrictedSshCommands {
  my $self = shift;
  return $self->{allowOwnersUnrestrictedSshCommands};
}

sub isDoubleLock {
  my $self = shift;
  return $self->{isDoubleLock};
}

sub doubleLockId {
  my $self = shift;
  return $self->{doubleLockId};
}

sub enableInheritPermissions {
  my $self = shift;
  return $self->{enableInheritPermissions};
}

sub passwordTypeWebScriptId {
  my $self = shift;
  return $self->{passwordTypeWebScriptId};
}

sub siteId {
  my $self = shift;
  return $self->{siteId};
}

sub enableInheritSecretPolicy {
  my $self = shift;
  return $self->{enableInheritSecretPolicy};
}

sub secretPolicyId {
  my $self = shift;
  return $self->{secretPolicyId};
}

sub lastHeartBeatStatus {
  my $self = shift;
  return $self->{lastHeartBeatStatus};
}

sub lastHeartBeatCheck {
  my $self = shift;
  return $self->{lastHeartBeatCheck};
}

sub failedPasswordChangeAttempts {
  my $self = shift;
  return $self->{failedPasswordChangeAttempts};
}

sub lastPasswordChangeAttempt {
  my $self = shift;
  return $self->{lastPasswordChangeAttempt};
}

sub secretTemplateName {
  my $self = shift;
  return $self->{secretTemplateName};
}

sub responseCodes {
  my $self = shift;
  return $self->{responseCodes};
}

1;

~~~~