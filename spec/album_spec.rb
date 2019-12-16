
    require('rspec')
    require('album')

    describe(Album) do
    describe('#this_album') do
      it('test') do
        test = Album.new()
        expect(test.this_album()).to(eq('test'))
      end
    end
  end
  