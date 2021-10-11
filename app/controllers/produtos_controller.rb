class ProdutosController < ApplicationController


    before_action :set_produto, only: [:edit, :update, :destroy]
    before_action :carrega_departamento, only: [:new, :create, :update]

    def index
        @produtos = Produto.order(nome: :asc).limit 5
        @produtos_com_desconto = Produto.order(:preco).limit 1
    end

    def new
        @produto = Produto.new
    end 
    
    def edit
        renderiza_departamento :edit
    end

    def update        
        if @produto.update get_produto_params
            display_message("alterado")
        else
            renderiza_departamento :edit
        end
    end

    def create        
        @produto = Produto.new get_produto_params
        if @produto.save
            display_message("criado")
        else
            renderiza_departamento :new
        end
    end

    def destroy
        @produto.destroy
        redirect_to root_url
    end

    def search
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

    def carrega_departamento
        @departamentos = Departamento.all
    end

    def display_message(acao)
        flash[:notice] = "Produto #{acao} com sucesso!"
        redirect_to root_url
    end

    private

    def get_produto_params
        params.require(:produto).permit(:nome, :descricao, :preco,
        :quantidade, :departamento_id)
    end

    def set_produto
        @produto = Produto.find(params[:id])
    end

    def renderiza_departamento(view)
        carrega_departamento
        render view
    end



end
