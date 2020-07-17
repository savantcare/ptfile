module.exports = {
    launch: {
        headless: process.env.HEADLESS !== 'false',
        slowMo: process.env.SLOWMO ? process.env.SLOWMO : 30,
        defaultViewport: {width: 1440, height: 900},
        devtools: false,
        args: [
            "--start-maximized", // --start-fullscreen --start-maximized
            "--ignore-certificate-errors"
        ]
    }
}