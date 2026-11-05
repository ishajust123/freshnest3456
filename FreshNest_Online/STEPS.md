# Put FreshNest online with real sign-up, log-in and saved data

No server to run. Supabase (free) keeps the accounts and the data. Netlify (free) hosts the page.

## Part 1: Supabase (about 5 minutes)
1. Go to **supabase.com**, sign up, and click **New project**. Pick any name and a database password (save it), then wait 1 to 2 minutes.
2. Left menu: **Authentication**, then **Sign In / Providers** (or **Providers**), open **Email**, and turn **OFF** "Confirm email". Save. (This lets people log in straight after signing up.)
3. Left menu: **SQL Editor**, then **New query**. Open `supabase_setup.sql`, copy everything, paste it, click **Run**. It should say "Success".
4. Left menu: **Project Settings**, then **API** (or **Data API / API Keys**). Copy:
   - the **Project URL** (looks like `https://abcd1234.supabase.co`)
   - the **anon public** key (a long text; a "publishable" key also works)
   Never copy the **service_role** or "secret" key.

## Part 2: Connect the page
1. Open `index.html` in Notepad.
2. Press Ctrl+F and search for `const SB=`.
3. Paste your two values between the quotes, like this:
   `const SB={url:"https://abcd1234.supabase.co",key:"eyJ...your long key..."};`
4. Save the file.

## Part 3: Make it public
1. Go to **app.netlify.com/drop** and drag `index.html` onto the page.
2. Open the link it gives you, click **Sign up**, create an account, and add a number on the scoreboard.
3. The status above the scoreboard should say **"Online database connected · live"**.

## See your data
In Supabase: **Table Editor**, then **records** (the scoreboard rows), and **Authentication**, then **Users** (accounts). Passwords are stored scrambled and nobody can read them.

## Good to know
- The anon key is meant to be public. The rules in the SQL file decide who can read and write.
- The role (store manager, finance, student) is saved on the account for display only. It does not change what a person is allowed to do.
- It works on Netlify or GitHub Pages. It does NOT work on the claude.ai page, which blocks outside connections.
- Free Supabase projects pause after about a week of no use. Open the dashboard and click Restore.

## If sign-up or log-in shows an error
1. **"This email already has an account"**: the account exists. Click **I already have an account** and log in with the password you used the first time.
2. **"Please confirm your email first"**: in Supabase go to **Authentication, then Users**, click the **...** next to the user and choose **Confirm user** (or delete the user and sign up again). Also make sure **Confirm email** is OFF in Authentication, Providers, Email.
3. **"Wrong email or password"**: use the same password as at sign-up. To start fresh, delete the user in Authentication, Users and sign up again.
4. **Status says "Online database not reachable"**: the Project URL or key in `index.html` is wrong or has extra spaces. Paste them again between the quotes. The URL must start with `https://` and end with `.supabase.co`.
5. **Still stuck?** Press F12, click **Console**, try again, and send the red text.
