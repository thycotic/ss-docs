[title]: # (Document Conventions)
[tags]: # (Document Conventions)
[priority]: # (1000)

# Document Conventions

## Capitalization

Technical writing is typically so awash in capitalization that it often denotes nothing and harms legibility. To counter that, in general, this document follows the IBM Style Guide rule:

*\"Do not capitalize the names of features and components unless they are sold separately or are trademarked.\"*

More specifically, the only things capitalized in this document are:

- Company, person, country, geographic place, or organization names
- Official or trademarked products or services, unless they officially have atypical capitalization, for instance *iPod*. 
- Acronyms and initializations
- When referring to any UI labels that are capitalized
- When the word begins a sentence or phrase

## Code and Command Line Text

Variable text in literal typed-in text and command-line parameters follow these industry-wide standards:

- All code and command-line interface text appears in `monospaced` text.
- Required parameters appear in angle brackets: `ping <hostname>`
- Optional parameters appear in square brackets: `mkdir [-p] <dirname>`
- Repeated parameters are followed by ellipses: `cp <source1> [source2...] <dest>`
- Multiple choice items are separated by vertical bars and grouped by curly brackets: `netstat {-t|-u}`

## Keyboard Shortcuts

- Keyboard keys are bolded and surrounded with square brackets: **[Enter]**
- Concurrent key presses are denoted with plus signs: **[Ctrl]**+**[Alt]**+**[Del]**
- Sequential key presses are denoted by commas: **[Page Down]**, **[Enter]**

## Notes

There are three types of notes: _regular_,  _important_ and _warning_.

> **Note:** Regular notes have a title, either "Note" or something custom, which appears as a phrase followed by a colon at the beginning of the note. A note contains tangential (an aside) or supplemental information (a tip or clarification).

> **Important:** Important notes contain substantive information that should be heeded, or negative consequences can occur, involving frustration, wasted time, or minor data loss.

> <span style="color:red">**Warning:**</span> Warning notes contain substantive information that should be heeded, or negative consequences can occur, involving injury, major data loss, or equipment damage.

## Other Special Text

- Email addresses and URLs are usually denoted by a colored underline: <support@thycotic.com>. 
- When URLs are part of the instruction, as opposed to clickable link, they appear in monospaced text: Type `https://www.somewhere.com` or click https://www.somewhere.com.
- Cross-references to headings are hyperlinks: See [Booting a Server][].
- Document or article names (not sections) appear in italics: See the _Server Administration Guide_. They may or may not be hyperlinks.
- All file and folder paths appear in monospaced text: `app\bin\web_config.xml`
- File names by themselves do *not* appear in monospaced text: web_config.xml. If the file name contains spaces, the name is surrounded by quotation marks: "web config.xml".

> **Note:** Ending punctuation may be omitted for clarity when following typed-in text, including URLs.

## Screen Components and Attentional Targets

- Mouse-click, keyboard, and other attentional targets (anything a looks for) are denoted by bold type: **OK** button or **Login** link.

- Attentional Targets and screen component names in system _responses_ are not bolded: "The OK button appears" verses "Click the **OK** button."

- Names of screen components, such as tabs, buttons, and text boxes, are corrected for spelling and capitalization. The component type appears in lowercase. Example: **SEARVER CONFIGURATION** window becomes **Server Configuration** window.
