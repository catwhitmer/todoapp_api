class Api::V1::TodosController < ApplicationController

    def index
        @todos = Todo.all 

        render json: @todos
    end

    def show
        set_todo

        render json: @todo
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: { errors: @todo.errors.full_messages}
        end
    end

    def update
        set_todo
        @todo.update(todo_params)

        render json: @todo
    end

    def destroy
        todo = Todo.find(params[:id])
        if @todo
            @todo.destroy
            
            render json: todo
        else
            render json: { errors: @todo.errors.full_messages}
    end


    private

    def set_todo
        @todo = Todo.find_by(id: params[:id])
    end

    def todo_params
        params.require(:todo).permit(:notes)
    end
end