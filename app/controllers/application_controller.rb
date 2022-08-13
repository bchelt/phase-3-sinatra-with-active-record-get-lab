class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    baked_goods = Bakery.find(params[:id])
    baked_goods.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order("price DESC")
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.order("price DESC").first
    baked_good.to_json
  end
end
