# The simplest possible blog website - minima theme

Make a [github](https://github.com/) account. "Fork" [my repository](https://github.com/sebanalysis/testsite) and name it `<account-name>.github.io`.

https://github.com/sebanalysis/testsite

This is hosted for free on github pages. The posts are in the `_posts folder`. They have to be named according to a particular convention. You can write an `about.md` file.

Edit the `_config.yaml` file. With all your own data. Note that the `theme:` is `minima`. Thi

Open `Settings > Pages`

Then deploy from a branch and choose: master or main. 

That is all. 

# Using a different theme - remote themes

The only theme supported by jekyll, without a plugin or using additional software to build the website before every launch is 'minima', because the github pages default gemfile points to it. Minima is on the jekyll github account and hardcoded somewhere to be always available as the default theme.

If you want to use another theme, you either have to use a remote-themes plugin by referencing the GH repo, or you have to create a Gemfile and reference the theme

You have to make sure your conventions are compatible. Some of the remote themes don't have an 'about' page, or they use different names for the layouts.

The only way to to do this is to download a template theme and rebuild your whole website within it.


# Getting the custom domain

Buy the domain on google domains. It is the easiest provider.

On google domains, and add the IP addresses from the [GitHub guide](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain): Step 5.

Create A records with these IP addresses.

And create a CNAME from `www` to `www.yourdomain.com`. 


In GitHub, go to:

Repo > Settings > Pages > add custom domain



# General Look

First serve the website so you can see all the live changes:

```
bundle exec jekyll serve --livereload
```

## Colours

In `_sass\minima.scss`:
Change all the colours:

```scss
$text-color: #111 !default;

$background-color: #FFFFDD !default;

$brand-color: #2a7ae2 !default;
```

## Fonts

  Change the fonts:
  Add the link to the font in the `_includes\head.html` just anywhere in the head tag:
  ```html
    <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
</head>
```

Then, in the `_sass\minima.scss` file, change the font to:

```scss
$base-font-family: "Inconsolata";
```


# Improve SEO - get people to see the site
https://github.com/jekyll/jekyll-seo-tag

# Posts


Note: If you make a post with a date in the future, it will not show until the date has been passed.

Justify the text `\_sass\minima\_layout.scss"`, go into `.post-content {`, and add to insert the first line:

```css
.post-content {
  text-align: justify;
```


# Add Math Rendering

Add this script into every post, at least once, anywhere in the file:

```
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
```

Note that `$...$` means inline math and `$$...$$` means a math block. 

> Never add Whitespace after the leading `$` or `$$` or trailing whitespace after the trailing `$` or `$$` as this will break the render, and will just show literal text, even if it works in the VSCode or Obsidian renderer.

✅ `$x__{2}$`
❌ `$ x_{2} $`




# Add RSS Feed

The `/feed.xml` address, is already set up by default in the config and gemfile. All that is required is for someone to paste the url into their RSS reader.

# Add comments

https://cuda-chen.github.io/blogging/2020/03/28/add-Disqus-to-Jekyll-Minima-theme-simplified.html

Subscribe to an $11 per month plan with Discus to receive comments.


# Add google analytics

Just add to the `_config`, the measurement ID tag for the site.

```
google_analytics: G-RISTNRISON
```

The theme is already set up to use it.

# Add Favicon

Add to the head tag in the `_includes\head.html` file.
```html
  {% assign sitedir = site.url | append: site.baseurl | append: "/" %}
  {% assign favicon_location = sitedir | append: site.favicon_location %}
  <link rel="icon" type="image/ico" href="{{ favicon_location }}">
  <link rel="shortcut-icon" type="image/ico" href="{{ favicon_location }}">
</head>
```

Add to the `_config`:
```
favicon_location: assets/favicon.ico
```

Put the ico file in the assets folder.

# Errors



```
gem cleanup bundler
gem install bundler
bundle lock --add-platform x86_64-linux
gem install nokogiri -v '1.10.1' --source 'https://rubygems.org/'
```

Add to `_config.yml` if local serve
```
repository: sebanalysis/testsite
```

Add to `Gemfile`
```
gem "webrick"
```