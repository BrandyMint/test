# -*- encoding : utf-8 -*-
class SMatrix
  def initialize num
    @max_nget = num.to_i
    #Проверяю на соответсвие квадратной матрицы
    mth1 = Math.sqrt(@max_nget).to_i
    mth2 = mth1**2
      if mth2 == @max_nget
        @num_col = mth1.to_i
      else
        @answer = 'Matrix is ​​not square'
      end
  end

  def create(size)
    x = 0
    Array.new(size) do |r| 
      Array.new(size) do |c| 
        x += 1
      end
    end
  end

  def showing
    if @num_col == nil
      #Если есть какая-то ошибка в введеном числе, просто выведем сообщение
        puts @answer
        exit
    else
      #Если определили число столбцов и строк, то заполним массив
      c,r = @num_col-1,@num_col-1
      mas = create(@num_col)

      i,k,n,x,y = [1,@max_nget,0,0,0]
      le = @max_nget.to_s.length
      while i <= @num_col
        i += 1
        #Шаг в право
	while y < c
          mas[x][y] = k.to_s.ljust(le)
	  y += 1
          k -= 1
        end
        #Шаг в низ
	while x < r
	  mas[x][y] = k.to_s.ljust(le)
          x += 1
          k -= 1
        end
        #шаг в лево
	while y >= n
	  mas[x][y] = k.to_s.ljust(le)
	  y -= 1
	  k -= 1
        end	
        #Шаг в вверх
        y += 1
        if k == 0
          break
        else
          k += 1
        end
        while x > n
          mas[x][y] = k.to_s.ljust(le)
            x -= 1
            k -= 1
        end
        c,r = c-1,r-1
        n,x,y = n+1,x+1,y+1

        if k == 0
          break
	end
      end
      mas.each do |cr|
        puts "#{cr.map { |r| format(r) }.join(' ')}"
      end	
    end
  end
end

puts 'Enter the number of the correct matrix:'
get_a = gets.chomp

think1 = SMatrix.new get_a
think1.showing
