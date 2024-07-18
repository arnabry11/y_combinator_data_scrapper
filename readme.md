# Y Combinator Scraper
It's a small sinatra app that can extract data from [Y Combinator website](https://www.ycombinator.com/companies). The scrapeing happens with help of capybara. The entry points are defined in `application.rb`

# About Y combinator
Y Combinator is a startup accelerator that has invested in over 4,000 companies that have a combined valuation of over $600B. The overall goal of Y Combinator is to help startups really take off.

# Requirements
- ruby 3.3.4
- chromedriver

# Usage
- Clone this repository
- Go inside the newly created directory and perform bundle install
- Now run `bundle exec puma -C puma.rb`
- visit `localhost:3001`

# Sample Data

|name           |location              |short_description                                            |yc_batch|website                  |founders                                                        |founder_linkedins                                                                                                                                                                                                       |
|---------------|----------------------|-------------------------------------------------------------|--------|-------------------------|----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Airbnb         |San Francisco, CA, USA|Book accommodations around the world.                        |W09     |http://airbnb.com        |Brian Chesky, Nathan Blecharczyk, Joe Gebbia                    |https://www.linkedin.com/in/brianchesky/, https://www.linkedin.com/in/blecharczyk/, https://www.linkedin.com/in/jgebbia/                                                                                                |
|Amplitude      |San Francisco, CA, USA|Digital Analytics Platform                                   |W12     |https://amplitude.com    |Spenser Skates, Curtis Liu                                      |https://www.linkedin.com/in/spenserskates, https://www.linkedin.com/in/jerry-klingenberger-15027791                                                                                                                     |
|Coinbase       |San Francisco, CA, USA|Buy, sell, and manage cryptocurrencies.                      |S12     |https://www.coinbase.com |Brian Armstrong                                                 |https://www.linkedin.com/in/barmstrong/                                                                                                                                                                                 |
|DoorDash       |San Francisco, CA, USA|Restaurant delivery.                                         |S13     |http://doordash.com      |Tony Xu, Andy Fang, Stanley Tang                                |https://www.linkedin.com/in/xutony, https://www.linkedin.com/in/fangsterr, https://www.linkedin.com/in/stanleytang                                                                                                      |
|Dropbox        |San Francisco, CA, USA|Backup and share files in the cloud.                         |S07     |http://dropbox.com       |Drew Houston, Arash Ferdowsi                                    |https://www.linkedin.com/in/drewhouston/, https://www.linkedin.com/in/arashferdowsi/                                                                                                                                    |
|Ginkgo Bioworks|Boston, MA, USA       |Our mission is to make biology easier to engineer.           |S14     |http://ginkgobioworks.com|Barry Canton, Austin Che, Jason Kelly, Tom Knight, Reshma Shetty|https://www.linkedin.com/in/barry-canton-6826424/, https://www.linkedin.com/in/austinche/, https://www.linkedin.com/in/jrkelly2/, https://www.linkedin.com/in/tom-knight-2236324/, https://www.linkedin.com/in/rpshetty/|
|GitLab         |San Francisco, CA, USA|A complete DevOps platform delivered as a single application.|W15     |http://gitlab.com/       |Sid Sijbrandij, Dmytro Zaporozhets                              |http://nl.linkedin.com/in/sijbrandij, https://www.linkedin.com/in/dzaporozhets                                                                                                                                          |
|Instacart      |San Francisco, CA, USA|Marketplace for grocery delivery and pickup                  |S12     |https://www.instacart.com|Apoorva Mehta, Brandon Leonardo, Max Mullen                     |https://www.linkedin.com/in/apoorvamehta/, https://www.linkedin.com/in/leonardo/, https://www.linkedin.com/in/maxmullen/                                                                                                |
|Momentus       |Santa Clara, CA, USA  |The space infrastructure services company                    |S18     |https://momentus.space   |Mikhail Kokorich                                                |https://linkedin.com/in/kokorich                                                                                                                                                                                        |
|Notable Labs   |Foster City, CA, USA  |Personalized drug discovery for blood cancer.                |W15     |http://notablelabs.com   |Matthew De Silva, Pete Quinzio                                  |https://www.linkedin.com/in/matthewdesilva/, https://www.linkedin.com/in/peter-quinzio-26083a35                                                                                                                         |



# Meta
- Author: Arnab
- LinkedIn: https://www.linkedin.com/in/arnab-roy-824b72157/
