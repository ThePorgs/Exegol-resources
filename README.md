
> **📌 This repository hosts code for Exegol images, a submodule of the Exegol project. 
> If you were looking for Exegol, go to [the main repo](https://github.com/ShutdownRepo/Exegol)**
___

# Exegol resources

This repository hosts various files that can be useful to Exegol users during pentest engagements, bug bounties, CTFs, and so on.
These resources are automatically downloaded, loaded and updated by the Exegol wrapper (entrypoint to the project) and can be shared (enabled by default) with Exegol containers.
Here is a non-exhaustive list of resources: SysinternalsSuite, WinEnum, pspy, PEASS, linux smart enumeration, mimikatz, nishang, PowerSploit, PrivescCheck, Inveigh, Juicy Potato, mimipy, mimipenguin, wso-webshell, LaZagne, BloodHound, LinEnum, SharpCollection, ...
All credits go to the authors of those tools. Some of the tools are loaded as submodules of this repo, others are obtained through wget for example. See [the script](./update-resources.sh)