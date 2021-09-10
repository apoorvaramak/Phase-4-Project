class PetsController < ApplicationController
    def index
        pets = Pet.all
        render json: pets
    end

    def show
        pet = Pet.find(params[:id])
        render json: pet
    end

    def create
        pet = Pet.create!(pet_params)
        render json: pet
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}
    end

    def destroy
        pet = Pet.find(params[:id])
        if pet
            pet.destroy
            head :content
        else
            render json: {error: "Pet not found"}, status: :not_found
        end
    end

    def update
        pet = Pet.find(params[:id])
        if pet
            pet.update(pet_params)
            render json: pet
        else
            render json: {error: "Pet not found"}, status: :not_found
        end
    end

    private

    def pet_params
        params.permit(:breed, :name, :age, :weight, :gps_chip, :shelter_id)
    end
end
