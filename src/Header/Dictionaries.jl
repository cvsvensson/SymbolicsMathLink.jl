# Define a dictionary that maps Mathematica function names to their Julia equivalents - not comprehensive
const MATHEMATICA_TO_JULIA_FUNCTIONS::Dict{String,Function} = Dict(
    "Plus" => +,
    "Times" => *,
    "Power" => ^,
    "Subtract" => -,
    "Divide" => /,
    "Sin" => sin,
    "Cos" => cos,
    "Tan" => tan,
    "ArcSin" => asin,
    "ArcCos" => acos,
    "ArcTan" => atan,
    "Sinh" => sinh,
    "Cosh" => cosh,
    "Tanh" => tanh,
    "ArcSinh" => asinh,
    "ArcCosh" => acosh,
    "ArcTanh" => atanh,
    "Exp" => exp,
    "Log" => log,
    "Sqrt" => sqrt,
    "Abs" => abs,
    "Rational" => //,
    "List" => function (x...)
        [numize_if_not_vector.(x)...]
    end,
    "Rule" =>(a,b)->a=>b,
    "C" => i->Symbolics.variable("C_$i"),
    "Part" => getindex,
    "Equal" => Base.:~,
    "Unequal" => !=,
    "Piecewise" => decode_piecewise,
    "Greater" => >,
    "Less" => <,
    "GreaterEqual" => >=,
    "LessEqual" => <=,
    "Complex" => (a,b)->a+b*im,
    "Conjugate" => conj,
    "Re" => real,
    "Im" => imag,
    "If" => Symbolics.IfElse.ifelse,
    "And" => Base.:&,
    "Or" => Base.:|,
    "Not" => Base.:!,
    "True" => x->true,
    "False" => x->false,
    "Pi" => x->π,
    "E" => x->exp(1),
    "I" => x->im,
    "Infinity" => x->Inf,
    "Indeterminate" => x->NaN,
    "Arg" => angle,
    "Mod" => mod,
    "Floor" => floor,
    "Ceiling" => ceil,
    "Round" => round,
    "Sign" => sign,
    "Min" => min,
    "Max" => max,
    "GoldenRatio" => x->(1+sqrt(5))/2,
    "GoldenAngle" => x->2π*(1+sqrt(5))/2,
    "ComplexInfinity" => x->Inf+Inf*im,
    "Undefined" => x->nothing,
    "Log10" => log10,
    "Log2" => log2,
    "LogisticSigmoid" => x->1/(1+exp(-x)),
    "Sinc" => sinc,
    "Factorial" => factorial,
    "Gamma" => gamma,
    "Erf" => erf,
    "Erfc" => erfc,
    "BesselJ" => besselj,
    "BesselY" => bessely,
    "BesselI" => besseli,
    "BesselK" => besselk,
    "HankelH1" => hankelh1,
    "HankelH2" => hankelh2,
    "Zeta" => zeta
)

const JULIA_FUNCTIONS_TO_MATHEMATICA = Dict(
    :+ => "Plus",
    :* => "Times",
    :^ => "Power",
    :- => "Subtract",
    :/ => "Divide",
    :sin => "Sin",
    :cos => "Cos",
    :tan => "Tan",
    :asin => "ArcSin",
    :acos => "ArcCos",
    :atan => "ArcTan",
    :sinh => "Sinh",
    :cosh => "Cosh",
    :tanh => "Tanh",
    :asinh => "ArcSinh",
    :acosh => "ArcCosh",
    :atanh => "ArcTanh",
    :exp => "Exp",
    :log => "Log",
    :sqrt => "Sqrt",
    :abs => "Abs",
    :// => "Rational",
    :~ => "Equal",
    :> => "Greater",
    :< => "Less",
    :>= => "GreaterEqual",
    :<= => "LessEqual",
    :!= => "Unequal",
    :conj => "Conjugate",
    :real => "Re",
    :imag => "Im",
    :getindex => "Part",
    :ifelse => "If",
    :and => "And",
    :or => "Or",
    :not => "Not",
    :arg => "Arg",
    :mod => "Mod",
    :floor => "Floor",
    :ceil => "Ceiling",
    :round => "Round",
    :sign => "Sign",
    :min => "Min",
    :max => "Max",
    :log10 => "Log10",
    :log2 => "Log2",
    :sinc => "Sinc",
    :factorial => "Factorial",
    :gamma => "Gamma",
    :erf => "Erf",
    :erfc => "Erfc",
    :besselj => "BesselJ",
    :bessely => "BesselY",
    :besseli => "BesselI",
    :besselk => "BesselK",
    :hankelh1 => "HankelH1",
    :hankelh2 => "HankelH2",
    :zeta => "Zeta"
)