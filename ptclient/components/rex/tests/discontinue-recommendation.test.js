const timeout = process.env.SLOWMO ? 30000 : 50000;

beforeAll(async () => {
    await page.goto(URL, {waitUntil: 'domcontentloaded'});
});

describe('Test header and title of the page', () => {
    test('Title of the page', async () => {
        const title = await page.title();
        await expect(title).toBe('Patient file');
    }, timeout);

    let element, addText;

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

    test('Discontinue Data Using Mouse click', async () => {
        await loadSkill(page);
        await delay(500);
		
		addText = 'Test using Mouse Click';
		await addRex(page, addText);

        const foundExitTr = await page.evaluate(() => {
        const tds = Array.from(document.querySelectorAll('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr > td:nth-child(3) > .cell'));
            let returnstatus = 0;
            let childNode = 1;
            tds.map(td => { 
                if(td.textContent) {
                    returnstatus = childNode;
                }
                childNode ++;
            });
            return returnstatus;
        });

        for(i=1 ; i <= foundExitTr; i++)
        {
            await page.waitForSelector('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child('+i+') > td:nth-child(3) > .cell');
            element = await page.waitForSelector('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child('+i+') > td:nth-child(3) > .cell');
            searchText = await page.evaluate(element => element.textContent, element);
            searchText = searchText.trim();

            if(searchText == addText)
            {
                await page.waitForSelector('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child('+i+') > td:nth-child(2) > .cell > .el-checkbox > .el-checkbox__input > .el-checkbox__inner');
                await page.click('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child('+i+') > td:nth-child(2) > .cell > .el-checkbox > .el-checkbox__input > .el-checkbox__inner');
				
				await page.waitForSelector('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child(2) > td:nth-child(4) > .cell > .el-button:nth-child(2) > span');
                await page.click('#recommendation-CurrentStateDisplayArea .el-table__body > tbody > tr:nth-child(2) > td:nth-child(4) > .cell > .el-button:nth-child(2) > span');
            }
        }

        await delay(3000);
    }, timeout);

    async function loadSkill(page) {
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
    }

    async function addRex(page, addText){
		await page.waitForSelector('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');
        await page.click('#currentStateDisplayArea > #search_component > .el-autocomplete > .el-input > .el-input__inner');

        await page.keyboard.press(`ArrowDown`);
        await delay(200);
        await page.keyboard.press(`a`);
		
        await page.waitForSelector('#pane-tab-add-recommendation .el-form-item__content > .el-card > .el-card__body > .el-textarea > .el-textarea__inner');
		await page.click('#pane-tab-add-recommendation .el-form-item__content > .el-card > .el-card__body > .el-textarea > .el-textarea__inner');
		await page.type('#pane-tab-add-recommendation .el-form-item__content > .el-card > .el-card__body > .el-textarea > .el-textarea__inner', addText);

        await delay(500);
        
        await page.waitForSelector('#pane-tab-add-recommendation .el-form > .el-form-item > .el-form-item__content > .el-button--success > span');
        await page.click('#pane-tab-add-recommendation .el-form > .el-form-item > .el-form-item__content > .el-button--success > span');

        await page.waitForSelector('.el-popup-parent--hidden > .el-notification > .el-notification__group > .el-notification__title');
        await delay(500);
		await page.keyboard.press(`Escape`);
    }

    function delay(time) {
        return new Promise(function(resolve) { 
            setTimeout(resolve, time)
        });
    }

});