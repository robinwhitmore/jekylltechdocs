When you want to create a Weebly theme, it's best to start with an existing theme and customize it. That way, you're sure to get all the code needed for your theme to work correctly on any Weebly site. We provide the Base theme for just this purpose.

We're going to use the LESS version of the theme so that we can take advantage of variables in our styles, which allows us to create color palettes.
​
1. Go to [https://github.com/Weebly/base-less-theme](https://github.com/Weebly/base-less-theme).

2. Click **Clone or download** and download the zip to a local directory.

3. Unzip the archive.
The zip you downloaded includes the root directory (Git Hub does this by default). Weebly themes need to have the files at the root of the archive and not the directory. So we need to create a new zip file in order to upload to Weebly.

4. In the directory that was created when you unzipped the archive (likely named `base-less-theme-master`), select all the files and create a new zip.
5. Name this zip `MyTheme.zip`.
    ​This is the start of the new theme.


{% include note.html content="Only include the files in the directory, and not the directory itself." %}

When working in the Weebly Code Editor, as you customize the theme, the files in the MyTheme zip are extracted and overwritten with the changes. If you ever want to start over, you'll need to reimport the original zip using a different name.
​
### What Just Happened?

You created a correctly structured zip file that can be imported into Weebly and applied as a theme to any Weebly site. Next, you'll create a test site that we'll use to develop the theme.