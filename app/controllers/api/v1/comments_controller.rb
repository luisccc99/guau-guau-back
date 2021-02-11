class Api::V1::CommentsController < ApplicationController
#TODO: Añadir validación
    #GET
    def getComments
        comm = Comment.all
        if !comm.empty?
            render json: comm, status: :ok
        else
            render json: {message: "There's nothing here yet."}, status: :unprocessable_entity
        end
    end

    #POST
    def addComment
        newComment = Comment.new(commentparams)

        if newComment.save()
            render json: newComment, status: :ok
        else
            render json: {message: "Unable to comment."}, status: :conflict
    end

    #PATCH
    def patchComment
        if @findedcomment
            if @findedcomment.update(commentparams)
                render json: @findedComment, status: :ok
            else
                render json: {message: "Failed to update."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Comment not found"}, status: :unprocessable_entity
        end
    end

    #DELETE
    def delComment
        if @findedcomment
            if @findedcomment.destroy()
                render json: {message: "Comment destroyed"}, status: :ok
            else
                render json: {message: "Failed to delete"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Comment not found"}, status: :unprocessable_entity
        end
    end

    private
    def commentparams
        #Checar si es necesario ingresar la FK o no. Omitida por el momento
        params.permit(:body)
    end
    def getcommentID
        @findedcomment = Comment.find(params[:id])
    end
end