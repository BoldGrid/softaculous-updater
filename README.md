![ScreenShot](https://www.boldgrid.com/assets/logos/boldgrid-logo-horizontal-black-lg.png)
# BoldGrid Custom Softaculous Package Updater

This is an example bash script for both creating and maintaining the BoldGrid custom package for Softaculous. This script is an example of how to automate the process for your server, and the steps are explained in this guide: https://www.boldgrid.com/support/advanced-tutorials/how-to-add-boldgrid-as-a-custom-softaculous-package/

## Getting Started

Since this is an example script, it is not meant to be deployed on a production server. For integration into your System, it is recommended to review this script with your System Administrator and test on a staging server before deploying live. 

This script also includes bgrid.sql, info.xml, and install.xml to work with Softaculous One Click Installer, and Automatically installs the Grid One Welcome Inspiration when a user installs the custom script on their domain from Softaculous.

![ScreenShot](https://raw.githubusercontent.com/harryjackson1221/boldgrid-pkg-softaculous-updater/master/gridone.jpg)

### Prerequisites

To install this software your server should be running Linux, and have the following dependencies installed:
wget
zip
tar

### Installing

To install this script, you would run the following commands:

```
wget https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/bgpkgupdater.sh; chmod +x bgpkgupdater.sh; ./bgpkgupdater
```

## Authors

* **Harry Jackson** - *Initial work* - [BoldGrid](https://www.boldgrid.copm)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspirations 
