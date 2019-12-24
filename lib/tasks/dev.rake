namespace :dev do
  desc "Limpa o BD e cria novamente"
  task setup: :environment do
    if Rails.env.development?
      puts %x(rails db:drop db:create db:migrate)
      %x(rails dev:add_mining_type)
      %x(rails dev:add_coins)
    else
      puts "Voce não está em ambiente de desenvolvimento!"
    end
  end

desc "Cadastra as moedas"
task add_coins: :environment do
        coins = [{
                description: "Bitcoin",
                acronym: "BTC",
                url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png",
                mining_type: MiningType.find_by(acronym: 'PoW')
                },
                {
                description: "Ethereum",
                acronym: "ETH",
                url_image: "https://www.coinopsy.com/media/img/quality_logo/ethereum-eth.png",
                mining_type: MiningType.all.sample
                },
                {
                description: "Ripple",
                acronym: "XRP",
                url_image: "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/ripple_xrp_coin-512.png",
                mining_type: MiningType.all.sample
                },
                {
                description: "Dash",
                acronym: "DASH",
                url_image: "https://media.dash.org/wp-content/uploads/dash-d.png",
                mining_type: MiningType.all.sample
                }]
    
    coins.each { |coin| Coin.find_or_create_by!(coin) }
  end

desc "Cadastra os tipos de mineração"
task add_mining_type: :environment do
    mining_types = [{
                    description: "Proof of Work",
                    acronym: "PoW"
                    },
                    {
                    description: "Proof of Stake",
                    acronym: "PoS"
                    },
                    {
                    description: "Proof of Capacity",
                    acronym: "PoC"
                    }]
                
    mining_types.each { |type| MiningType.find_or_create_by!(type) }
  end
end
