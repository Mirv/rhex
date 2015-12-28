require_relative 'test_helper'

class TestGrid < Minitest::Test

  def setup
    @g = Hex::Grid.new
  end

  def test_set_get_and_hex
    assert_raises ArgumentError do
      @g.cset
    end

    assert_raises ArgumentError do
      @g.cset(1,2,3,4,5)
    end

    @g.hset( Hex::Axial.new( 15, 15 ) )
    refute @g.cget( 15, 15 ).val

    @g.hset( Hex::Axial.new( 15, 15 ), val: :value )
    assert_equal( @g.cget( 15, 15 ).val, :value )

    @g.cset( 15, 15 )
    refute @g.hget( Hex::Axial.new( 15, 15 ) ).val

    @g.cset( 15, 15, val: :value )
    assert_equal( @g.hget( Hex::Axial.new( 15, 15 ) ).val, :value )
  end

  # def test_xy_to_hex
  #
  #   0.upto( 50 ).each do |y|
  #     0.upto( 20 ).each do |x|
  #       h = @g.hex_at_xy( x, y )
  #       puts "(#{x},#{y}) -> (#{h.q},#{h.r})"
  #     end
  #   end
  #
  #   h = @g.hex_at_xy( 0, 0 )
  #   assert_equal( Hex::Axial.new( 0, 0 ), h )
  #
  #   h = @g.hex_at_xy( @g.hex_width, 0 )
  #   assert_equal( Hex::Axial.new( 1, 0 ), h )
  #
  #   h = @g.hex_at_xy( 0, @g.hex_height )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  #   h = @g.hex_at_xy( @g.hex_width, @g.hex_height )
  #   assert_equal( Hex::Axial.new( 1, 1 ), h )
  #
  #   h = @g.hex_at_xy( 9, 17 )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  #   h = @g.hex_at_xy( 13, 24 )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  #   h = @g.hex_at_xy( 14, 23 )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  #   h = @g.hex_at_xy( 14, 24 )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  #   h = @g.hex_at_xy( 20, 30 )
  #   assert_equal( Hex::Axial.new( 0, 1 ), h )
  #
  # end

end