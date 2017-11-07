#CS410_ChunYung (Open this on new windows for better view)

===Code Refactoring (Nov 6th, 2017)===
index.html contains a lot of css code and js code is at the end of <body> tag,
there's also no <HEAD> tag.
--I create head tag.
--I move all the css code into: css/style.css
--I move all the js code into <HEAD> tag of index.html
  
===Database Update (Nov 6th, 2017)===
Rather than using table for user's name and password,
I now create accounts for them instead --
seems like it's a correct way to login.
--There should be an "exampleUser.sql" for you guys to import and test.
