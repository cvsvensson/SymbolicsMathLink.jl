function wcall(head::AbstractString, args...; returnJulia=false,kwargs...)
    """
    wcall(head::AbstractString, args...; returnJulia=false, kwargs...)

    Calls a Mathematica function on arguments of Symbolics and other Julia types, converting those arguments to Mathematica, and then changing the result back to Julia.

    # Arguments
    - `head::AbstractString`: The name of the Mathematica function to call.
    - `args...`: The arguments to the Mathematica function. These can be Symbolics, Julia types, or Mathematica types.
    - `returnJulia::Bool=false`: If `true`, the function will return a Mathematica MathLink object instead of converting back to Julia.
    - `kwargs...`: Keyword arguments to the Mathematica function. These can be Symbolics, Julia types, or Mathematica types.

    # Returns
    - If `returnJulia` is `false` (default), returns a Mathematica MathLink object representing the result of the Mathematica function.
    - If `returnJulia` is `true`, returns a Julia expression representing the result of the Mathematica function.

    # Examples
    ```julia
    julia> wcall("Solve", x^2 + 2x + 1 == 0)
    MathLink.MathLinkObject(...)

    julia> wcall("Solve", x^2 + 2x + 1 == 0; returnJulia=true)
    2-element Array{Sym,1}:
    -1 + x
    -1 - x
    ```
"""
    return wcall(head, expr_to_mathematica.(args)...;returnJulia=returnJulia, kwargs...)
end
wcall(head::AbstractString, args::Vararg{Mtypes}; returnJulia=false, kwargs...) = begin
    mathematica_result = weval(MathLink.WSymbol(head)(args...; kwargs...))
    if istrue(returnJulia)
        return mathematica_to_expr(mathematica_result)
    else
        return mathematica_result
    end
end

export wcall