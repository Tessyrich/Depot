require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
   @title = "The Great Book #{rand(1000)}"

  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
  
    post products_url, params: {
        product: {
          description: @product.description,
          image_url: @product.image_url,
          price: @product.price,
          title: @title,
        }
      }
  
    end
    assert_redirected_to product_url(Product.last)
 end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
 
    patch product_url(@product), params: {
        product: {
          description: @product.description,
          image_url: @product.image_url,
          price: @product.price,
          title: @title,
        }
      }
  
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
  test "should show product on index page" do
    get products_url
    assert_response :success
    assert_select 'h2', @product.title
    assert_select 'p', @product.description
    assert_select 'img[src=?]', @product.image_url
    assert_select 'p.price', /\$[,\d]+\.\d\d/
  end
  test "should not create product with invalid data" do
end
