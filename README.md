# Windows 11 autounattend.xml (local account, privacy off)

A minimal answer file for a **stock** Windows 11 install USB (Media Creation Tool or Microsoft's ISO). It changes
nothing inside the Windows image; Windows Setup simply reads it from the USB stick.

## What it does

- English (US) language, region and US keyboard
- Accepts the licence
- Skips the Microsoft-account and network screens and creates **one local administrator account**
- Answers the privacy questions with **off** (optional diagnostic data, tailored experiences, advertising ID,
  location and similar). Windows Pro and Home can't go below "Required" diagnostic data by policy.

Setup still stops at three pages, on purpose:

1. **Product key:** click *I don't have a product key*
2. **Windows version:** pick the edition your PC is licensed for (Home, Pro, ...), so it activates with your digital licence
3. **Disk:** pick the disk yourself. The file never selects or wipes a disk, so a wrong drive can't be erased by accident

It does **not** bypass TPM, Secure Boot or RAM checks.

## How to use

1. Make the install USB with the [Media Creation Tool](https://www.microsoft.com/software-download/windows11).
2. Download [`autounattend.xml`](autounattend.xml) (keep that exact file name, no `.txt`).
3. Edit it: replace `CHANGE-ME-USER` and `CHANGE-ME-PASSWORD` with your account name and password.
4. Copy it to the **root** of the USB stick.
5. Boot from the USB and answer the three pages above.
6. After the first sign-in, check the time zone (Settings > Time & language; the default for en-US is Pacific).
7. **Delete `autounattend.xml` from the stick**: the password is in plain text. Until you do, don't boot the stick on
   another PC, or it starts the same setup there.

Other languages: change the four `en-US` values and `InputLocale` (`0409:00000409` = US keyboard) in both places.

Uses only answer-file settings documented by Microsoft (`Microsoft-Windows-Shell-Setup`,
`Microsoft-Windows-International-Core`, `Microsoft-Windows-Setup`). Not yet tested on a real 25H2 install: if another
setup page appears, open an issue.
