
![[Pasted image 20230122194333.png]]
[superuser.com](https://superuser.com/posts/1629652/timeline)

See al users with: `lusrmgr.msc`

There are many different types – they don't necessarily represent individual objects, but "security identifiers" (SIDs). Some types which you can enter in this dialog are:

-   User account names (either the username or the full name is accepted).
	- `Get-LocalUser`
-   Group names (e.g. built-in groups such as "Administrators", "Users", 
	- `whoami /groups`
- "Backup Operators", but also custom groups created through lusrmgr.msc).
-   Computers (only in Active Directory networks). When a system service on computer A wants to access a resource on computer B, it doesn't have its own user account so it will use the computer's "machine account".
-   Special built-in users such as "SYSTEM" which represents system services (kinda similar to root on Linux).
-   Logon indicators such as "INTERACTIVE" (gained by all interactive sessions, i.e. when you log in via console or Remote Desktop), "NETWORK" (gained by all logons via File Sharing, or passwordless logons via WinRM/SSH), "BATCH" (Task Scheduler scheduled tasks).
-   Virtual "well-known groups" such as "Everyone" (this is mostly equal to "Authenticated Users" now), "Local Users" (i.e. not Active Directory users), and so on.
-   Template principals such as "CREATOR OWNER" which do nothing on their own, but are expanded into the actual user during inheritance. For example, if a folder grants Modify rights to "CREATOR OWNER", and you create a file inside, then your account is granted Modify rights.

## Registry

In linux and FreeBSD, all config is in text fiiles. In windows it is in a hierarchical folder tree in the 'registry'. It is saved to disk in various 'hives'. But explorable as a folder structure as below:

In powershell:

```
regedit
```

Or:

```
cd HKLM:
cd HKCU:
```

Or

```
cd HKLM:/
cd HKCU:/
```

HKLM: is largely saved under :
```
c:\Windows\System32/config
```

Your user registry (wallpaper, screensaver) hive is at:

```
c:/Users/Seb/NTUSER.dat
```

Download [sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/microsoft-store):

```
winget search sysinternals
```

If you get it from microsoft store it is:

```
winget install 9P7KNL5RWT25 --source msstore
```

.NET Appliacations do __NOT__ use the registry, they use XML files for config. 

Portable apps do __NOT__ use the registry, they use their local directory. COntrol panel is twhere all the tolls are to safely modify the registry. Lanuage changes the registry.


