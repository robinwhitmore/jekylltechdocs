## `account.tpl`

The `account` partial displays a dialog with information about what pages a user can access. If they are the owner, they are shown a message. If they have access to pages, those pages are listed. If they do not have access to pages, another message is displayed.
{% include image.html file="partial_membershipAccount.png" caption="Account partial" %}


## `denied.tpl`

When a user tries to access a page they don't have access to, the `denied` partial displays in a dialog.
{% include image.html file="partial_membershipDenied.png" caption="Denied partial" %}


## `login-signup.tpl`

The `login-signup` partial displays in a dialog where the user can either register or log in.
{% include image.html file="partial_membershipLogin.png" caption="Login/sign-up partial" %}


## `reset-password.tpl`

The `reset-password` partial displays when a user clicks "Reset password" in the Log In dialog.
{% include image.html file="partial_membershipReset.png" caption="Reset password partial" %}


## `set-password.tpl`

The `set-password` partial displays in a dialog when the user clicks the link provided in the welcome email sent when a user is added as a member.
{% include image.html file="partial_membershipSet.png" caption="Set password partial" %}