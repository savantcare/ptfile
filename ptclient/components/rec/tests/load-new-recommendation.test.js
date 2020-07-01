const timeout = process.env.SLOWMO ? 30000 : 50000;

beforeAll(async () => {
    await page.goto(URL, {waitUntil: 'domcontentloaded'});
});

describe('Test header and title of the page', () => {
    test('Title of the page', async () => {
        const title = await page.title();
        await expect(title).toBe('Patient file');
    }, timeout);

    let element, text;

    test('Log in with confirmed account', async () => {
        await expect(page).toClick('.el-col > .el-card > .el-card__header > .clearfix > span');
        await expect(page).toMatch("Login to PatientFile");

        await page.waitForSelector('input[type="text"]');
        await page.click('input[type="text"]');
        await page.type('.el-form > .el-form-item:nth-child(1) > .el-form-item__content > .el-input > .el-input__inner','user1@mail.com')
        
        await page.waitForSelector('input[type="password"]');
        await page.click('input[type="password"]');
        await page.type('input[type="password"]','123')
        
        await page.waitForSelector('.el-form > .el-form-item > .el-form-item__content > .el-button > span');
        await page.click('.el-form > .el-form-item > .el-form-item__content > .el-button > span');
    }, timeout);

    test('Load Recommendation', async () => {
        await page.waitForSelector('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');
        await page.click('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');

        await page.type('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner', 'clear');
        await delay(500);
        await page.keyboard.press(`Enter`);

        await page.waitForSelector('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');
        await page.click('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');

        await page.type('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner', 'rex');
        await page.waitForSelector('.el-scrollbar > .el-autocomplete-suggestion__wrap > ul > li:nth-child(1) > .value');
        await page.click('.el-scrollbar > .el-autocomplete-suggestion__wrap > ul > li:nth-child(1) > .value');

        await page.waitForSelector('#recommendation-CurrentStateDisplayArea > .el-card__header > .clearfix > div > span');
        let element = await page.waitForSelector('#recommendation-CurrentStateDisplayArea > .el-card__header > .clearfix > div > span');
        await expect(element).toMatch('Recommendation');

        // Panel Focusing
        await page.waitForSelector('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');
        await page.click('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');

        await page.keyboard.press(`ArrowDown`);
        await delay(200);
        await page.keyboard.press(`f`);

        await page.waitForSelector('#recommendation-multiStateDisplayArea > .el-card__header > .clearfix > div > span');
        await page.click('#recommendation-multiStateDisplayArea > .el-card__header > .clearfix > div > span');
        element = await page.waitForSelector('#recommendation-multiStateDisplayArea > .el-card__header > .clearfix > div > span');
        await expect(element).toMatch('Recommendation');
    }, timeout);

    function delay(time) {
        return new Promise(function(resolve) { 
            setTimeout(resolve, time)
        });
    }

});