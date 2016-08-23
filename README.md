# bamboo-console
Use Atlassian Bamboo from the command line

Note : this is a fork from https://bitbucket.org/atlassian/bamboo-cli

## Install

* `sudo gem install bamboo-console`
* set `BAMBOO_URL`, `BAMBOO_USERNAME` and `BAMBOO_PASSWORD` environment variables


## Commands

    bamboo-console help [TASK]  # Describe available tasks or one specific task
    bamboo-console clone KEY NEWKEY  # Clones a plan configuration
    bamboo-console info KEY     # Gets the info (including if its building or not) of a plan or job
    bamboo-console me           # Gets information about the current user
    bamboo-console pause        # Pause the server from building
    bamboo-console queue KEY    # Queues the given build
    bamboo-console resume       # Resume the server from pause
    bamboo-console server       # Gets information about the server

## Examples

### Start a build

`bamboo-console queue BAM-BOO`

### Start a build and run all Manual Stages

`bamboo-console queue BAM-BOO --allstages`

### Continue an existing build from a Manual Stage

`bamboo-console queue BAM-BOO-123 --stage="Deployment"`

### Continue an existing build and run all uncompleted Manual Stages

`bamboo-console queue BAM-BOO-123 --allstages`

### Clone a build

`bamboo-console clone BAM-BOO NEW-KEY`

## License

Apache License Version 2.0 http://www.apache.org/licenses/LICENSE-2.0
