## Emails Sent From Cloud Admin or a User's Site Can't be Delivered

### Issue:


Weebly Cloud sends out emails automatically, based on user action in the Cloud Admin and in a Weebly site. Sometimes, these emails cannot be delivered.

### Details:


For example, the Cloud Admin sends the Team Member User Invitation (when a new team member is created) and the User Invitation (when a user is created). Emails from the Cloud Admin are sent from `noreply@<domain.com>`, where `domain.com` is the URL that you entered when you set up your footer message.

Weebly sites also send email when certain events happen, such as member registration or placing an order in an online store. These emails are sent from the email configured by the user.

### Fix:

In both cases, because Weebly sends these emails as your domain (for the admin) or as the user's email, but they actually come from a Weebly IP address, they often fail SPF checks. To fix this, the Weebly IP needs to be added to the SPF record.

Here's the Weebly IP:
    `ip4:74.115.48.0/22`

For your Cloud Admin, this record needs to be added to the site where Weebly Cloud is hosted.

For user sites, the record needs to be added to the domain where their Weebly site is hosted.

Each host will have a different way of adding the record. Users should contact their host for more info.