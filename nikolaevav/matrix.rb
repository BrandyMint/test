# -*- encoding : utf-8 -*-
class SMatrix
  def initialize num
    @min_num = 0
    @max_num = 1601
    @max_nget = num.to_i
    #Проверяю число, на валидность
    if (num == '' or @max_nget <= @min_num or @max_nget >= @max_num)
      @answer = 'Пожалуйста введите число правильной матрицы от 1 до 1600'
    else
    #Проверяю на соответсвие квадратной матрицы
	      x = @min_num
	      while x <= @max_nget
		  y = x*x
		  if y > @max_nget
		    @answer = 'Матрица не соответсвует квадрату'
		    @num_col = 0
		    break
		  elsif y == num.to_i
		    @num_col = x
		    break
		  else
		    x +=1
		  end
	      end
    end
  end

  def create(size)
    x = 0
    Array.new(size) do |r| 
      Array.new(size) do |c| 
        x = x+1
      end
    end
  end

  def showing
	if @num_col == 0
	#Если есть какая-то ошибка в введеном числе, просто выведем сообщение
	   @answer
	else
	#Если определили число столбцов и строк, то заполним массив
	c,r = @num_col-1,@num_col-1
	mas = create(@num_col)

	i,k,n,x,y = [1,@max_nget,0,0,0]

	   while i <= 4
	      i += 1

	 	#Шаг в право
		while y < c
		 mas[x][y] = k
		 y += 1
	         k -= 1
		end
		#Шаг в низ
		while x < r
		 mas[x][y] = k
		 x += 1
	         k -= 1
		end
		#шаг в лево
		while y >= n
		 mas[x][y] = k
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
		mas[x][y] = k
		 x -= 1
	         k -= 1
		end
		c,r = c-1,r-1
		n,x,y = n+1,x+1,y+1

		if k == 0
		 break
		end
	   end
	  
  	mas.each{|r| p r}
	puts 

	end
  end
end

puts 'Введите конечно число правильной матрицы:'
get_a = gets.chomp

think1 = SMatrix.new get_a
puts think1.showing
