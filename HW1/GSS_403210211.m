%f = @(x) x.^4-14*x.^3+60*x.^2-70*x; %chong example
%[xx, nn] = GSS(f, 0, 2, 0.3);

function [x_min, N] = GSS(f, a, b, epsilon, varargin)    
    N = 0;
    if (b - a < epsilon)
        x_min = (a + b) / 2;
        return
    end
    rho = (3 - sqrt(5)) / 2;
    a_i = a + rho * (b - a);
    b_i = a + (1 - rho) * (b - a);
    N = 1;    
    while true
        f_a = f(a_i, varargin{:});
        f_b = f(b_i, varargin{:});
        if (f_a < f_b)
            b = b_i;
            b_i = a_i;
            a_i = a + rho * (b - a);
        else
            a = a_i;
            a_i = b_i;
            b_i = a + (1 - rho) * (b - a);
        end
        if (b - a < epsilon)
            break
        end
        N = N + 1;
    end
    x_min = (a + b) / 2;
end

