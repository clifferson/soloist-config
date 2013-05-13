
### Requires 
 * Ruby
 * Xcode and/or Command line tools

## Install and run soloist 

```bash
curl -L https://raw.github.com/clifferson/soloist-config/master/install.sh | sh
```

This should be all you have to do to get your OS X 10.8 running.

## What now?
install.sh will pull down the Cheffile (for gathing cookbook deps with librarian) and soloistrc which conatins the run list and node objects for soloist
install and run the (soloist)[https://github.com/mkocher/soloist] gem which will manage and run a chef-solo run.

cookbooks from (pivotal-sprout)[https://github.com/pivotal-sprout/sprout]
