class TenantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant, status: :ok
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        render json: tenant, status: :updated
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def render_not_found (error)
        render json: {errors: error}
    end

end
