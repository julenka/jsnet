# My notes
The generated/compiled html pages are now at https://github.com/julenka/julenka.github.io
The content for my html is still at https://github.com/julenka/jsnet
I use Jekyll to compile html from jsnet folder into julenka.github.io.

## Update domain 
I want to make https://juliaschwrz.net and https://www.juliaschwarz.net point to julenka.github.io
I followed https://help.github.com/en/articles/using-a-custom-domain-with-github-pages here are my steps:


1. [Add the custom domain to github pages](https://help.github.com/en/articles/adding-or-removing-a-custom-domain-for-your-github-pages-site). I updated the github pages config to point to juliaschwarz.net. This just updates a file called CNAME

2. [Set up the apex domain juliaschwarz.net](https://help.github.com/en/articles/setting-up-an-apex-domain). I updated my A record to point to the following addresses

    185.199.108.153
    185.199.109.153
    185.199.110.153
    185.199.111.153

And then tested as follows: 

    > dig +noall +answer juliaschwarz.net
    juliaschwarz.net.	14399	IN	A	185.199.110.153
    juliaschwarz.net.	14399	IN	A	185.199.109.153
    juliaschwarz.net.	14399	IN	A	185.199.111.153
    juliaschwarz.net.	14399	IN	A	185.199.108.153

I then waited 3 hours and saw my domains were updated!

3. Enable https. Finally I checked the "enable https" option in the github pages section of https://github.com/julenka/julenka.github.io/settings.

# Archive
## David's notes
My website is hosted by GitHub Pages.
My domain used to be configured with Bluehost (see below for Google Domains info).


Go to Bluehost’s Domain Manager and click on Manage DNS Records to make changes for a domain (AKA Zone Editor). 
This was needed to set up the domain to point to GitHub’s page initially.
I had to create two A records to point my apex domain to GitHub’s IP addresses.
I think the A records should use “@“ as the host.
You might also want to add a CNAME pointing “www" to davidklionsky.com
It’s OK to terminate my Bluehost hosting but still manage my domains with them.

My domains are now managed by domains.google.com.
Setup for pointing to GitHub pages is the same as above.
Create two A records pointing “@“ to the IP addresses from GitHub's instructions.
Optionally create a CNAME pointing “www” to davidklionsky.com
At some point I had to update the IP addresses in Google's A record to take advantage of GitHub’s https support. 