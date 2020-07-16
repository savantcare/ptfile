// Ref: https://medium.com/touch4it/end-to-end-testing-with-puppeteer-and-jest-ec8198145321
module.exports = {
    launch: {
        headless: false,
        slowMo: process.env.SLOWMO ? process.env.SLOWMO : 0,
        devtools: false
    }
}