module Api
  module V1
      class GamesController < ApplicationController
          def index
              games = Game.order('created_at DESC');
              render json: {status: 'SUCCESSO', message:'Jogos carregados', data:games},status: :ok
          end

          def show
              game = Game.find(params[:id]);
              render json: {status: 'SUCCESSO', message:'Jogo carregado', data:game},status: :ok
          end
          
          # GET /v1/orders/games/n/:name
          def find_by_name
            games = Game.where(name: /.*#{params[:name]}.*/i)
            render json: {status: 'SUCCESSO', message:'Jogos carregados', data:games},status: :ok
          end

          # GET /v1/orders/games/g/:genre
          def find_by_genre
            games = Game.where(genres: /.*#{params[:genre]}.*/i)
            render json: {status: 'SUCCESSO', message:'Jogos carregados', data:games},status: :ok
          end

          # GET /v1/orders/games/p/:platform
          def find_by_platform
            games = Game.where(platforms: /.*#{params[:platform]}.*/i)
            render json: {status: 'SUCCESSO', message:'Jogos carregados', data:games},status: :ok
          end

          def create
              game = Game.new(game_params)

              if game.save
                  render json: {status: 'SUCCESSO', message:'Jogo salvo', data:game},status: :ok
              else
                  render json: {status: 'ERRO', message:'Jogo não foi criado', data:game.errors},status: :unprocessable_entity
              end
          end

          def destroy
              game = Game.find(params[:id]);
              game.destroy
              render json: {status: 'SUCCESSO', message:'Jogo Deletado', data:game},status: :ok

          end

          def update
              game = Game.find(params[:id]);
              if game.update_attributes(game_params)
                  render json: {status: 'SUCCESSO', message:'Jogo Editado', data:game},status: :ok
              else
                  render json: {status: 'ERRO', message:'Jogo não pode ser editado', data:game.errors},status: :unprocessable_entity
              end
          end

          private

          def game_params
              params.permit(:name, :description, :platforms, :genres, :publishers, :developers, :release_date, :score, :image)
          end
      end    
  end
end