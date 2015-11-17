# Gravatar2Contacts

Sets the image of OS X Contacts to the Gravatar image

## Usage

This is just a command-line utility that will go through your entire OS X
AddressBook and set the image of your contacts to the Gravatar image matching
the email address for the contact.

To run it, open the project in XCode and Run.

The program will only query Gravatars for contacts without image. As a result, already set images (manual or previous runs) will be kept.
If no Gravatar is found for a contact it does not change the image.

### Known Issues

* If a contact has multiple email address with Gravatars associated with them,
  it will use the last one.
