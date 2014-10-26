# Gravatar2Contacts

Sets the image of OS X Contacts to the Gravatar image

## Usage

This is just a command-line utility that will go through your entire OS X
AddressBook and set the image of your contacts to the Gravatar image matching
the email address for the contact.

To run it, open the project in XCode and Run.

If no Gravatar is found for a contact it does not change the image.

However, if any Gravatar is found for a contact, it will replace the existing
image. In other words, we always use the latest image from Gravatar.

This has the side effect that if you change an image for a contact, run this
program, and they have a different Gravatar, your custom image will be
overwritten.

### Known Issues

* If a contact has multiple email address with Gravatars associated with them,
  it will use the last one.
