Vagrant setup for a basic CLAM setup (ColdFusion, Linux, Apache, MySQL).
In general, just run ```vagrant up``` and you're good to go (read below for more info)

Based on the excellent cf10 Chef cookbook by nmische at https://github.com/wharton/chef-coldfusion10; I just Vagrantized it. 

You'll need Vagrant 1.2+ and vagrant-berkshelf plugin. (Could do away with Berkshelf if you want to manage cookbooks yourself; see Berksfile for list)

As with all Adobe CF recipes, license requires that you obtain the ColdFusion bits yourself. See the synced folder in the Vagrantfile (and update it correct path on your machine; this is where you put the CF 10 Linux 32 or 64 bit binary)

You'll also want to update the Vagrant box used, if you want a version other than Ubuntu 12.04. YMMV.

Based mostly off of vanilla recipes, with custom recipe for creating database. Note that this recipe was created with Berkshelf, so could probably be much simpler, as it's confined to cookbooks/main/recipes/default.rb.

When it's all said and done, you'll have CF10 on Ubuntu 12.04 at 10.10.10.133. CF Admin password is "vagrant". Datasource called "vagrantdb" is setup, pointing to MySQL db of same name. MySQL user is root; password is "vagrant" (not best security practice, but as this is likely a dev machine, shouldn't be a worry)
