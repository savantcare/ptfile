const timeout = process.env.SLOWMO ? 30000 : 10000;

beforeAll(async () => {
    await page.goto('http://10.1.3.150/pf/abcd', {waitUntil: 'domcontentloaded'});
});

describe('Test header and title of the page', () => {
    test('Title of the page', async () => {
        const title = await page.title();
        await expect(title).toBe('patient-file');
    }, timeout);

    test('Test for Reminder', async () => {
        await page.waitForSelector('div:nth-child(3) > .el-card > .el-card__header > .clearfix > span')
        await page.click('div:nth-child(3) > .el-card > .el-card__header > .clearfix > span')
        let element = await page.waitForSelector('div:nth-child(3) > .el-card > .el-card__header > .clearfix > span');
        await expect(element).toMatch('Reminders');
        await page.waitForSelector('.el-card:nth-child(2) > .el-card__header > .clearfix > .el-button-group > .el-button--success > span')
        await page.click('.el-card:nth-child(2) > .el-card__header > .clearfix > .el-button-group > .el-button--success > span')
        await page.keyboard.press(`Escape`);
    }, timeout);
});