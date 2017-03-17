module TypedSvg.Attributes
    exposing
        ( AccumulateOption(..)
        , AdditiveOption(..)
        , AttributeTypeOption(..)
        , BezierAnchorPoint
        , CalcModeOption(..)
        , ClipOption(..)
        , CoordinateSystem(..)
        , DurationValue(..)
        , EdgeModeOption(..)
        , LengthAdjustOption(..)
        , MarkerCoordinateSystem(..)
        , ModeOption(..)
        , ShapeRenderingOption(..)
        , TimingValue(..)
        , Transform(..)
          {--Regular Attributes-}
        , accentHeight
        , accelerate
        , accumulate
        , additive
          -- , alphabetic
          -- , allowReorder
          -- , amplitude
          -- , arabicForm
        , ascent
        , attributeName
        , attributeType
          -- , autoReverse
        , azimuth
        , baseFrequency
          -- , baseProfile
          -- , bbox
        , begin
        , bias
          -- , by
        , calcMode
          -- , capHeight
        , class
        , clipPathUnits
        , compositeOperator
        , contentScriptType
        , contentStyleType
        , cx
        , cy
        , d
          -- , decelerate
          -- , descent
        , diffuseConstant
        , divisor
        , dur
        , dx
        , dy
        , edgeMode
        , elevation
          -- , enableBackground
        , end
          -- , exponent
        , externalResourcesRequired
        , filterRes
        , filterUnits
          -- , format
        , from
          -- , g1
          -- , g2
          -- , glyphName
          -- , glyphRef
        , gradientTransform
        , gradientUnits
          -- , hanging
          -- , horizAdvX
          -- , horizOriginX
          -- , horizOriginY
          -- , id
          -- , ideographic
        , in_
        , in2
          -- , intercept
          -- , k
        , k1
        , k2
        , k3
        , k4
        , kernelMatrix
        , kernelUnitLength
          -- , keyPoints
        , keySplines
        , keyTimes
          -- , lang
        , lengthAdjust
        , limitingConeAngle
          -- , local
        , markerHeight
        , markerUnits
        , markerWidth
        , maskContentUnits
        , maskUnits
          -- , mathematical
        , max
          -- , media
          -- , method
        , min
        , mode
          -- , name
        , morphologyOperator
        , numOctaves
          -- , offset
          -- , operator -- see compositeOperator, morphologyOperator
        , order
          -- , orient
          -- , orientation
          -- , origin
        , overlinePosition
        , overlineThickness
          -- , panose1
          -- , path
        , pathLength
        , patternContentUnits
        , patternTransform
        , patternUnits
          -- , pointOrder
        , points
        , pointsAtX
        , pointsAtY
        , pointsAtZ
        , preserveAlpha
        , preserveAspectRatio
        , primitiveUnits
        , r
        , radius
          -- , refX
          -- , refY
          -- , renderingIntent
        , repeatCount
        , repeatDur
          -- , requiredExtensions
        , requiredFeatures
        , restart
        , result
          -- , rotate
        , rx
        , ry
        , scale
        , seed
          -- , slope
          -- , spacing
          -- , specularConstant
          -- , specularExponent
          -- , speed
          -- , spreadMethod
          -- , startOffset
          -- , stdDeviation
          -- , stemh
          -- , stemv
          -- , stitchTiles
          -- , strikethroughPosition
          -- , strikethroughThickness
          -- , string
        , style
        , surfaceScale
          -- , systemLanguage
          -- , tableValues
          -- , target
        , targetX
        , targetY
        , textLength
        , title
        , to
        , transform
        , type_
          -- , u1
          -- , u2
        , underlinePosition
        , underlineThickness
          -- , unicode
          -- , unicodeRange
          -- , unitsPerEm
          -- , vAlphabetic
          -- , vHanging
          -- , vIdeographic
          -- , vMathematical
        , values
        , version
          -- , vertAdvY
          -- , vertOriginX
          -- , vertOriginY
        , viewBox
          -- , viewTarget
          -- , widths
          -- , xChannelSelector
          -- , xlinkActuate
          -- , xlinkArcrole
        , xlinkHref
          -- , xlinkRole
        , xlinkShow
        , xlinkTitle
          -- , xlinkType
          -- , xmlBase
        , xmlLang
        , xmlSpace
          -- , yChannelSelector
        , z
          -- , zoomAndPan
          --
          {--Length or Position Attributes-}
        , fx
        , fy
        , height
        , width
        , x
        , y
        , y1
        , x1
        , x2
        , y2
          --
          {--Presentation Attributes-}
          -- , alignmentBaseline
          -- , baselineShift
          -- , clipPath
          -- , clipRule
          -- , clip
          -- , colorInterpolationFilters
          -- , colorInterpolation
          -- , colorProfile
          -- , colorRendering
          -- , color
          -- , cursor
          -- , direction
          -- , display
          -- , dominantBaseline
          -- , enableBackground
          -- , fillOpacity
          -- , fillRule
          -- , fill
          -- , filter
          -- , floodColor
          -- , floodOpacity
          -- , fontFamily
          -- , fontSizeAdjust
          -- , fontSize
          -- , fontStretch
          -- , fontStyle
          -- , fontVariant
          -- , fontWeight
          -- , glyphOrientationHorizontal
          -- , glyphOrientationVertical
          -- , imageRendering
          -- , kerning
          -- , letterSpacing
          -- , lightingColor
          -- , markerEnd
          -- , markerMid
          -- , markerStart
          -- , mask
          -- , opacity
          -- , overflow
          -- , pointerEvents
          -- , shapeRendering
          -- , stopColor
          -- , stopOpacity
          -- , strokeDasharray
          -- , strokeDashoffset
          -- , strokeLinecap
          -- , strokeLinejoin
          -- , strokeMiterlimit
          -- , strokeOpacity
          -- , strokeWidth
          -- , stroke
          -- , textAnchor
          -- , textDecoration
          -- , textRendering
          -- , unicodeBidi
          -- , visibility
          -- , wordSpacing
          -- , writingMode
        )

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgba)
import Html exposing (Html, a)
import Svg exposing (Attribute, Svg, a, svg)
import Svg.Attributes as Attr exposing (contentScriptType, enableBackground, externalResourcesRequired, gradientTransform, kernelMatrix, kernelUnitLength, lengthAdjust, limitingConeAngle, markerHeight, name, pathLength, patternContentUnits, preserveAlpha, preserveAspectRatio, surfaceScale)
import TypedSvg.Lengths exposing (..)


{-| The Transform type is used by `transform` and `gradientTransform`
-}
type Transform
    = Matrix Float Float Float Float Float Float
    | Rotate Float Float Float
    | Scale Float Float
    | SkewX Float
    | SkewY Float
    | Translate Float Float


transformToString : Transform -> String
transformToString xform =
    let
        tr name args =
            String.concat
                [ name
                , "("
                , String.join " " (List.map toString args)
                , ")"
                ]
    in
        case xform of
            Matrix a b c d e f ->
                tr <| "matrix" [ a, b, c, d, e, f ]

            Rotate a x y ->
                tr <| "rotate" [ a, x, y ]

            Scale x y ->
                tr <| "scale" [ x, y ]

            SkewX x ->
                tr <| "skewX" [ x ]

            SkewY y ->
                tr <| "skewY" [ y ]

            Translate x y ->
                tr <| "translate" [ x, y ]


{-| In a future version of TypedSvg, this may be turned into a DSL
-}
type alias ClockValue =
    String


timingValueAsString : TimingValue -> String
timingValueAsString timingValue =
    case timingValue of
        TimingOffsetValue clock ->
            clock

        TimingSyncBaseValue str ->
            str

        TimingEventValue str ->
            str

        TimingRepeatValue str ->
            str

        TimingAccessKeyValue str ->
            str

        TimingWallclockSyncValue str ->
            str

        TimingIndefinite ->
            "indefinite"


{-| Used by `begin` and `end` in constraining animation times
-}
type TimingValue
    = TimingOffsetValue ClockValue
    | TimingSyncBaseValue String
    | TimingEventValue String
    | TimingRepeatValue String
    | TimingAccessKeyValue String
    | TimingWallclockSyncValue String
    | TimingIndefinite


{-| CoordinateSystem is used by filter and clip
-}
coordinateSystemToString : CoordinateSystem -> String
coordinateSystemToString coordinateSystem =
    case coordinateSystem of
        CoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        CoordinateSystemObjectBoundingBox ->
            "objectBoundingBox"


type CoordinateSystem
    = CoordinateSystemUserSpaceOnUse
    | CoordinateSystemObjectBoundingBox


boolToString : Bool -> String
boolToString bool =
    case bool of
        True ->
            "true"

        False ->
            "false"


{-| Defines the distance from the origin to the top of accent characters,
    measured by a distance within the font coordinate system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accent-height
-}
accentHeight : number -> Attribute a
accentHeight height =
    Attr.accentHeight <| toString height


{-| Defines a simple acceleration of time for the element. Element time will
    accelerate from a rate of 0 at the beginning up to a run rate, over the
    course of the specified proportion of the simple duration.

    The default value is 0 (no acceleration).

    Legal values for `rate` are floating point values between 0 and 1
    (inclusive).

    See https://www.w3.org/TR/smil/smil-timemanip.html#TimeManip-accelerateSyntax
-}
accelerate : number -> Attribute a
accelerate rate =
    Attr.accelerate <| toString rate


{-| This attribute controls whether or not the animation is cumulative.

    It is useful for repeated animations to build upon the previous results,
    accumulating with each iteration.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accumulate
-}
accumulate : AccumulateOption -> Attribute a
accumulate option =
    Attr.accumulate <|
        case option of
            AccumulateNone ->
                "none"

            AccumulateSum ->
                "sum"


type AccumulateOption
    = AccumulateNone
    | AccumulateSum


{-| This attribute controls whether or not the animation is additive.

    It is frequently useful to define animation as an offset or delta to an
    attribute's value, rather than as absolute values.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/additive
-}
additive : AdditiveOption -> Attribute a
additive option =
    Attr.additive <|
        case option of
            AdditiveNone ->
                "none"

            AdditiveReplace ->
                "replace"


type AdditiveOption
    = AdditiveNone
    | AdditiveReplace


{-| This attribute defines the maximum unaccented depth of the font within the
    font coordinate system.

    If the attribute is not specified, the effect is as if the attribute were
    set to the vert-origin-y value for the corresponding font.

    Used by Elements: fontFace

    See https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ascent
-}
ascent : number -> Attribute a
ascent maxDepth =
    Attr.ascent <| toString maxDepth


{-| This attribute indicates the name of the attribute in the parent element
    that is going to be changed during an animation.

    Used by Elements: animate, animateColor, animateTransform, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeName
-}
attributeName : String -> Attribute a
attributeName name =
    Attr.attributeName name


{-| This attribute specifies the namespace in which the target attribute and its
    associated values are defined.

    Used by Elements: animate, animateColor, animateTransform, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeType
-}
attributeType : AttributeTypeOption -> Attribute a
attributeType option =
    Attr.attributeType <|
        case option of
            AttributeTypeAuto ->
                "auto"

            AttributeTypeCss ->
                "CSS"

            AttributeTypeXml ->
                "XML"


type AttributeTypeOption
    = AttributeTypeAuto
    | AttributeTypeCss
    | AttributeTypeXml


{-|
    The azimuth attribute represents the direction angle of the light source on
    the XY plane (clockwise), in degrees from the x axis.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feDistantLight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/azimuth
-}
azimuth : number -> Attribute a
azimuth angle =
    Attr.azimuth <| toString angle


{-|
    The baseFrequency attribute represents the frequency parameter for the noise
    function of the feTurbulence primitive. The first number represents a base
    frequency in the X direction and the second value represents a base
    frequency in the Y direction.

    Negative values are forbidden.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseFrequency
-}
baseFrequency : number -> number -> Attribute a
baseFrequency xFrequency yFrequency =
    Attr.baseFrequency <| (toString xFrequency) ++ " " ++ (toString yFrequency)


{-|
    This attribute defines when an animation should begin.

    Each individual value can be one of the BeginValue types.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
    See: https://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists
-}
begin : List TimingValue -> Attribute a
begin timingValues =
    Attr.begin <| String.join ";" (List.map timingValueAsString timingValues)


{-|
    The bias attribute shifts the range of a filter. After applying the
    kernelMatrix of the feConvolveMatrix element to the input image to yield a
    number and applying the divisor attribute, the bias attribute is added to
    each component. This allows representation of values that would otherwise
    be clamped to 0 or 1.

    If bias is not specified, then the effect is as if a value of 0 were
    specified.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/bias
-}
bias : number -> Attribute a
bias rangeShift =
    Attr.bias <| toString rangeShift


{-|
    This attribute specifies the interpolation mode for an animation. The
    default mode is linear, however if the attribute does not support linear
    interpolation (e.g. for strings), the calcMode attribute is ignored and
    discrete interpolation is used.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/calcMode
-}
calcMode : CalcModeOption -> Attribute a
calcMode option =
    Attr.calcMode <|
        case option of
            CalcModeDiscrete ->
                "discrete"

            CalcModeLinear ->
                "linear"

            CalcModePaced ->
                "paced"

            CalcModeSpline ->
                "spline"


type CalcModeOption
    = CalcModeDiscrete
    | CalcModeLinear
    | CalcModePaced
    | CalcModeSpline


{-|
    Assigns a class name or set of class names to an element. You can use this
    to style SVG content using CSS.

    An element's class name serves two key roles:

    - As a style sheet selector, for when an author assigns style information
      to a set of elements.
    - For general use by the browser.

    Used by Elements: a, altGlyph, circle, clipPath, defs, desc, ellipse,
        feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood,
        feGaussianBlur, feImage, feMerge, feMorphology, feOffset,
        feSpecularLighting, feTile, feTurbulence, filter, font, foreignObject,
        g, glyph, glyphRef, image, line, linearGradient, marker, mask,
        missingGlyph, path, pattern, polygon, polyline, radialGradient, rect,
        stop, svg, switch, symbol, text, textPath, title, tref, tspan, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class
-}
class : List String -> Attribute a
class names =
    Attr.class (String.join " " names)


{-|
    The clip attribute has the same parameter values as defined for the css clip
    property. Unitless values, which indicate current user coordinates, are
    permitted on the coordinate values on the <shape>. The value of auto defines
    a clipping path along the bounds of the viewport created by the given
    element.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css clip for further information.

    Used by Elements: svg, symbol, image, foreignobject, pattern, marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip
-}
clip : ClipOption -> Attribute a
clip option =
    Attr.clip <|
        case option of
            ClipAuto ->
                "auto"

            ClipInherit ->
                "inherit"

            ClipShape top right bottom left ->
                "rect("
                    ++ (toString top)
                    ++ " "
                    ++ (toString right)
                    ++ " "
                    ++ (toString bottom)
                    ++ " "
                    ++ (toString left)
                    ++ ")"


type ClipOption
    = ClipAuto
    | ClipInherit
    | ClipShape Length Length Length Length


{-|
    The clipPathUnits attribute defines the coordinate system for the contents
    of the clipPath element.

    If the clipPathUnits attribute is not specified, then the effect is as if
    a value of userSpaceOnUse were specified.

    Note that values defined as a percentage inside the content of the clipPath
    are not affected by this attribute. It means that even if you set the value
    of maskContentUnits to objectBoundingBox, percentage values will be
    calculated as if the value of the attribute were userSpaceOnUse.

    Used by Elements: clipPath

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clipPathUnits
-}
clipPathUnits : CoordinateSystem -> Attribute a
clipPathUnits coordinateSystem =
    Attr.clipPathUnits <| coordinateSystemToString coordinateSystem


{-|
    compositeOperator defines the compositing operation that is to be performed
    in the `feComposite` element

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator
-}
compositeOperator : CompositeOperator -> Attribute a
compositeOperator operator =
    Attr.operator <|
        case operator of
            CompositeOperatorOver ->
                "over"

            CompositeOperatorIn ->
                "in"

            CompositeOperatorOut ->
                "out"

            CompositeOperatorAtop ->
                "atop"

            CompositeOperatorXor ->
                "xor"

            CompositeOperatorArithmetic ->
                "arithmetic"


type CompositeOperator
    = CompositeOperatorOver
    | CompositeOperatorIn
    | CompositeOperatorOut
    | CompositeOperatorAtop
    | CompositeOperatorXor
    | CompositeOperatorArithmetic


{-|
    The contentScriptType attribute on the <svg> element specifies the default
    scripting language for the given document fragment.

    This attribute sets the default scripting language used to process the value
    strings in event attributes. This language must be used for all instances of
    scripts that do not specify their own scripting language. The value
    contentType specifies a media type, per MIME Part Two: Media Types
    [RFC2046]. The default value is application/ecmascript.

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentScriptType
-}
contentScriptType : String -> Attribute a
contentScriptType mimeType =
    Attr.contentScriptType mimeType


{-|
    This attribute specifies the style sheet language for the given document
    fragment. The contentStyleType is specified on the <svg> element. By
    default, if it's not defined, the value is "text/css"

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/contentStyleType
-}
contentStyleType : String -> Attribute a
contentStyleType styleSheetLanguage =
    Attr.contentStyleType styleSheetLanguage


{-|
    This attribute defines a path to follow.

    NOTE: You probably want to import the "folkertdev/svg-path-dsl" package for
        access to a more Elm-like way of expressing paths. For instance:

        [ path
            [ d (pathToString [
                subpath
                    (startAt (10, 10))
                    open
                    [ cubicTo
                        (10, 50)
                        (90, 50)
                        (90, 90)
                    ]
                ])
            , stroke Color.black
            , strokeWidth 3.5
            , noFill
            ]
            []

    Used by Elements: path

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d
-}
d : String -> Attribute a
d =
    Attr.d


{-|
    The diffuseConstant attribute represant the kd value in the Phong lighting
    model. In SVG, this can be any non-negative number.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feDiffuseLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/diffuseConstant
-}
diffuseConstant : number -> Attribute a
diffuseConstant kdValue =
    Attr.diffuseConstant kdValue


{-|
    After applying the kernelMatrix of the feConvolveMatrix element to the input
    image to yield a number, that number is divided by the value given to the
    divisor attribute to yield the final destination color value. A divisor that
    is the sum of all the matrix values tends to have an evening effect on the
    overall color intensity of the result.

    The default value is the sum of all values in kernelMatrix, with the
    exception that if the sum is zero, then the divisor is set to 1.

    It is an error to specify a divisor of zero.

    Used by Elements:

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/divisor
-}
divisor : number -> Attribute a
divisor value =
    Attr.divisor <| toString value


{-|
    This attribute indicates the simple duration of the animation.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur
-}
dur : DurationValue -> Attribute a
dur duration =
    Attr.dur <| durationToString duration


type DurationValue
    = Duration ClockValue
    | DurationIndefinite


durationToString duration =
    case duration of
        Duration clockValue ->
            clockValue

        DurationIndefinite ->
            "indefinite"


{-|
    The edgeMode attribute determines how to extend the input image as necessary
    with color values so that the matrix operations can be applied when the
    kernel is positioned at or near the edge of the input image.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/edgeMode
-}
edgeMode : EdgeModeOption -> Attribute a
edgeMode option =
    Attr.edgeMode <|
        case option of
            EdgeModeDuplicate ->
                "duplicate"

            EdgeModeWrap ->
                "wrap"

            EdgeModeNone ->
                "none"


type EdgeModeOption
    = EdgeModeDuplicate
    | EdgeModeWrap
    | EdgeModeNone


{-|
    The elevation attribute represents the direction angle for a light source
    from the XY plane towards the Z axis, in degrees. Note the positive Z-axis
    points towards the viewer of the content.

    Used by Elements: feDistantLight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/elevation
-}
elevation : number -> Attribute a
elevation angle =
    Attr.elevation <| toString angle


{-|
    This attribute defines an end value for the animation that can constrain
    the active duration.

    Each value can be of the same type as the ones defined for the begin
    attribute.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/end
-}
end : List TimingValue -> Attribute a
end timingValues =
    Attr.end <| String.join ";" (List.map timingValueAsString timingValues)


{-|
    The externalResourcesRequired attribute is available on all container
    elements and to all elements which potentially can reference external
    resources. It specifies whether referenced resources that are not part of
    the current document are required for proper rendering of the given
    container element or graphics element.

    Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, animate,
        animateColor, animateMotion, animateTransform, circle, clipPath, cursor,
        discard, defs, ellipse, feImage, filter, font, foreignObject, g, glyph,
        glyphRef, image, line, linearGradient, mesh, meshGradient, marker, mask,
        mpath, path, pattern, polygon, polyline, radialGradient, rect, script,
        set, stop, svg, switch, symbol, text, textPath, tref, tspan, use, view

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired
-}
externalResourcesRequired : Bool -> Attribute a
externalResourcesRequired bool =
    Attr.externalResourcesRequired <| boolToString bool


{-|
    A <filter> element can define a region to which a given filter effect
    applies and can provide a resolution for any intermediate continuous tone
    images used to process any raster-based filter primitives.

    NOTE: Obsolete.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterRes
-}
filterRes : number -> number -> Attribute a
filterRes xPixels yPixels =
    Attr.filterRes <| (toString xPixels) ++ " " (toString yPixels)


{-|
    The filterUnits attribute defines the coordinate system for attributes x, y,
    width and height.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterUnits
-}
filterUnits : CoordinateSystem -> Attribute a
filterUnits coordinateSystem =
    Attr.filterUnits <| coordinateSystemToString coordinateSystem


{-|
    This attribute indicates the initial value of the attribute that will be
    modified during the animation. When used with the `to` attribute, the
    animation will change the modified attribute from the from value to the to
    value.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
-}
from : number -> Attribute a
from value =
    Attr.from <| toString value


{-|
    The gradientTransform attribute contains the definition of an optional
    additional transformation from the gradient coordinate system onto the
    target coordinate system (i.e., userSpaceOnUse or objectBoundingBox). This
    allows for things such as skewing the gradient. This additional
    transformation matrix is post-multiplied to (i.e., inserted to the right of)
    any previously defined transformations, including the implicit
    transformation necessary to convert from object bounding box units to user
    space.

    Used by Elements: linearGradient, radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientTransform
-}
gradientTransform : List Transform -> Attribute a
gradientTransform transforms =
    String.join " " (List.map transformToString transforms)


{-|
    The gradientUnits attribute defines the coordinate system for attributes
    x1, y1, x2 and y2 on the `linearGradient` element or for attributes cx, cy,
    r, fx, and fy on the `radialGradient`.

    If the `gradientUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: linearGradient, radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientUnits
-}
gradientUnits : CoordinateSystem -> Attribute a
gradientUnits coordinateSystem =
    Attr.gradientUnits <| coordinateSystemToString coordinateSystem


{-|
    The `in_` attribute identifies input for the given filter primitive.

    Takes type InValue, which can be one of 6 constants, or a reference

    If no value is provided and this is the first filter primitive, then this
    filter primitive will use `InSourceGraphic` as its input.

    If no value is provided and this is a subsequent filter primitive, then this
    filter primitive will use the result from the previous filter primitive as
    its input.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feGaussianBlur,
        feMorphology, feOffset, feSpecularLighting, feTile

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in
-}
in_ : InValue -> Attribute a
in_ value =
    Attr.in_ <| inValueToString value


type InValue
    = InSourceGraphic
    | InSourceAlpha
    | InBackgroundAlpha
    | InFillPaint
    | InStrokePaint
    | InReference String


inValueToString value =
    case value of
        InSourceGraphic ->
            "sourceGraphic"

        InSourceAlpha ->
            "sourceAlpha"

        InBackgroundAlpha ->
            "backgroundAlpha"

        InFillPaint ->
            "fillPaint"

        InStrokePaint ->
            "strokePaint"

        InReference str ->
            str


{-|
    The `in2` attribute identifies the second input for the given filter
    primitive. It works exactly like the in attribute.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feGaussianBlur,
        feMorphology, feOffset, feSpecularLighting, feTile

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in2
-}
in2 : InValue -> Attribute a
in2 value =
    Attr.in2 <| inValueToString value


{-|
    The k1 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k1
-}
k1 : number -> Attribute a
k1 value =
    Attr.k1 <| toString value


{-|
    The k2 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k2
-}
k2 : number -> Attribute a
k2 value =
    Attr.k2 <| toString value


{-|
    The k3 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k3
-}
k3 : number -> Attribute a
k3 value =
    Attr.k3 <| toString value


{-|
    The k4 attribute defines one of the values to be used within the arithmetic
    operation of the `feComposite` filter primitive.

    If this attribute is not set, its default value is 0.

    Used by Elements: feComposite

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/k4
-}
k4 : number -> Attribute a
k4 value =
    Attr.k4 <| toString value


{-|
    The `order` attribute defines the list of numbers that makes up the kernel
    matrix for the `feConvolveMatrix` element.

    The number of entries in the list must be equal to `orderX` x `orderY`, as
    defined in the `order` attribute.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelMatrix
-}
kernelMatrix : List number -> Attribute a
kernelMatrix numberList =
    Attr.kernelMatrix (String.join " " (List.map toString numberList))


{-|
    The kernelUnitLength attribute has two meaning based on the context it's
    used:

    - For lighting filter primitives, it indicates the intended distance in
      current filter units (i.e., units as determined by the value of attribute
      primitiveUnits) for `dx` and `dy`, respectively, in the surface normal
      calculation formulas.

    - For the `feConvolveMatrix` primitive, it indicates the intended distance
      in current filter units (i.e., units as determined by the value of
      attribute primitiveUnits) between successive columns and rows,
      respectively, in the kernelMatrix.

    Used by Elements: feConvolveMatrix, feDiffuseLighting, feSpecularLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kernelUnitLength
-}
kernelUnitLength : number -> number -> Attribute a
kernelUnitLength dx dy =
    Attr.kernelUnitLength <| (toString dx) ++ " " ++ (toString dy)


{-|
    The kerning attribute indicates whether the browser should adjust
    inter-glyph spacing based on kerning tables that are included in the
    relevant font (i.e., enable auto-kerning) or instead disable auto-kerning
    and instead set inter-character spacing to a specific length (typically,
    zero).

    The value of auto indicates that the user agent should adjust inter-glyph
    spacing based on kerning tables that are included in the font that will be
    used.

    If a <length> is provided, then auto-kerning is disabled. Instead,
    inter-character spacing is set to the given <length>. The most common
    scenario, other than auto, is to set kerning to a value of 0 so that
    auto-kerning is disabled.

    If a <length> is provided without a unit identifier (e.g., an unqualified
    number such as 128), the browser processes the <length> as a width value in
    the current user coordinate system.

    If a <length> is provided with a unit identifier (e.g., .25em or 1%), then
    the browser converts the <length> into a corresponding value in the current
    user coordinate system.

    When a <length> is provided, its value is added to the inter-character
    spacing value specified by the letter-spacing attribute.

    As a presentation attribute, it also can be used as a property directly
    inside a CSS stylesheet, see css kerning for further information.

    Used by Elements: altGlyph, altGlyphDef, glyph, glyphRef, textPath,
        text, tref, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kerning
-}
kerning : KerningOption -> Attribute a
kerning option =
    Attr.kerning <|
        case option of
            KerningAuto ->
                "auto"

            KerningInherit ->
                "inherit"

            KerningLength length ->
                lengthToString length


type KerningOption
    = KerningAuto
    | KerningInherit
    | KerningLength Length


{-|
    The keySplines attribute define a set of Bézier control points associated
    with the keyTimes list, defining a cubic Bézier function that controls
    interval pacing.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keySplines
-}
keySplines : List BezierAnchorPoint -> Attribute a
keySplines bezierAnchorPointList =
    Attr.keySplines <| (List.map bezierAnchorPointToString bezierAnchorPointList |> String.join ";")


type alias BezierAnchorPoint =
    ( Float, Float, Float, Float )


bezierAnchorPointToString ( x1, y1, x2, y2 ) =
    List.map toString [ x1, y1, x2, y1 ] |> String.join " "


{-|
    The keyTimes attribute is a semicolon-separated list of time `values` used
    to control the pacing of the animation. Each time in the list corresponds to
    a value in the values attribute list, and defines when the value is used in
    the animation. Each time value in the keyTimes list is specified as a
    floating point value between 0 and 1 (inclusive), representing a
    proportional offset into the duration of the animation element.

    If a list of keyTimes is specified, there must be exactly as many values in
    the keyTimes list as in the values list.

    Each successive time value must be greater than or equal to the preceding
    time value.

    Used by Elements: animate, animateColor, animateMotion, animateTransform

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyTimes
-}
keyTimes : List Float -> Attribute a
keyTimes floatList =
    Attr.keyTimes <| (List.map toString floatList |> String.join ";")


{-|
    When an SVG `text` or `tspan` element has a specific length set using the
    textLength attribute, the lengthAdjust attribute controls how the text is
    stretched or compressed into that length.

    The two possible values for the attribute are:

    - LengthAdjustSpacing
    - LengthAdjustSpacingAndGlyphs

    Using LengthAdjustSpacing (the default), the letter forms are preserved,
    but the space between them grows or shrinks.

    Using LengthAdjustSpacingAndGlyphs, the entire text element is stretched in
    the direction of the text.

    Used by Elements: text, tspan

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lengthAdjust
-}
lengthAdjust : LengthAdjustOption -> Attribute a
lengthAdjust option =
    Attr.lengthAdjust <|
        case option of
            LengthAdjustSpacing ->
                "spacing"

            LengthAdjustSpacingAndGlyphs ->
                "spacingAndGlyphs"


type LengthAdjustOption
    = LengthAdjustSpacing
    | LengthAdjustSpacingAndGlyphs


{-|
    The limitingConeAngle attribute represents the angle in degrees between
    the spot light axis (i.e. the axis between the light source and the point
    to which it is pointing at) and the spot light cone. So it defines a
    limiting cone which restricts the region where the light is projected.
    No light is projected outside the cone.

    If no value is specified, then no limiting cone will be applied.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/limitingConeAngle
-}
limitingConeAngle : number -> Attribute a
limitingConeAngle number =
    Attr.limitingConeAngle <| toString number


{-|
    The markerHeight represents the height of the viewport into which the
    `marker` is to be fitted when it is rendered.

    A value of zero disables rendering of the element.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerHeight
-}
markerHeight : Length -> Attribute a
markerHeight height =
    Attr.markerHeight <| lengthToString height


{-|
    The `markerUnits` attribute defines the coordinate system for the attributes
    `markerWidth`, `markerHeight` and the contents of the `marker`.

    If the `markerUnits` attribute is not specified, then the effect is as if a
    value of `strokeWidth` were specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerUnits
-}
markerUnits : MarkerCoordinateSystem -> Attribute a
markerUnits markerCoordinateSystem =
    Attr.markerUnits <|
        case markerCoordinateSystem of
            MarkerCoordinateSystemUserSpaceOnUse ->
                "userSpaceOnUse"

            MarkerCoordinateSystemStrokeWidth ->
                "strokeWidth"


type MarkerCoordinateSystem
    = MarkerCoordinateSystemUserSpaceOnUse
    | MarkerCoordinateSystemStrokeWidth


{-|
    The markerWidth represents the width of the viewport into which the
    `marker` is to be fitted when it is rendered.

    A value of zero disables rendering of the element.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: marker

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerWidth
-}
markerWidth : Length -> Attribute a
markerWidth width =
    Attr.markerWidth <| lengthToString width


{-|
    The maskContentUnits attribute defines the coordinate system for the
    contents of the `mask`.

    If the `maskContentUnits` attribute isn't specified, then the effect is as
    if a value of CoordinateSystemUserSpaceOnUse were specified.

    Note that values defined as a percentage inside the content of the `mask`
    are not affected by this attribute. It means that even if you set the value
    of `maskContentUnits` to CoordinateSystemObjectBoundingBox, percentage
    values will be calculated as if the value of the attribute were
    CoordinateSystemUserSpaceOnUse.

    Used by Elements: mask

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskContentUnits
-}
maskContentUnits : CoordinateSystem -> Attribute a
maskContentUnits coordinateSystem =
    Attr.maskContentUnits <| coordinateSystemToString coordinateSystem


{-|
    The `maskUnits` attribute defines the coordinate system for attributes x, y,
    width and height.

    If the `maskUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: mask

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskUnits
-}
maskUnits : CoordinateSystem -> Attribute a
maskUnits coordinateSystem =
    Attr.maskUnits <| coordinateSystemToString coordinateSystem


{-|
    This attribute specifies the maximum value of the active duration.

    The default value for max is 0. This does not constrain the active duration
    at all.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max
-}
max : ClockValue -> Attribute a
max clockValue =
    Attr.max <| clockValue


{-|
    This attribute specifies the minimum value of the active duration.

    The default value for max is 0. This does not constrain the active duration
    at all.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/min
-}
min : ClockValue -> Attribute a
min clockValue =
    Attr.min <| clockValue


{-|
    The mode attribute defines the blending mode on the `feBlend` filter
    primitive.

    Used by Elements: feBlend

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mode
-}
mode : ModeOption -> Attribute a
mode option =
    Attr.mode <|
        case option of
            ModeNormal ->
                "normal"

            ModeMultiply ->
                "multiply"

            ModeScreen ->
                "screen"

            ModeDarken ->
                "darken"

            ModeLighten ->
                "lighten"


type ModeOption
    = ModeNormal
    | ModeMultiply
    | ModeScreen
    | ModeDarken
    | ModeLighten


{-|
    The numOctaves parameter for the noise function of the `feTurbulence`
    primitive.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
numOctaves : Int -> Attribute a
numOctaves int =
    Attr.numOctaves <| toString int


{-|
    compositeOperator defines the compositing operation that is to be performed
    in the `feMorphology` element

    Used by Elements: feMorphology

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/operator
-}
morphologyOperator : MorphologyOperator -> Attribute a
morphologyOperator operator =
    Attr.operator <|
        case operator of
            MorphologyOperatorErode ->
                "erode"

            MorphologyOperatorDilate ->
                "dilate"


type MorphologyOperator
    = MorphologyOperatorErode
    | MorphologyOperatorDilate


{-|
    The order attribute indicates the size of the matrix to be used by an
    `feConvolveMatrix` element.

    The values provided must be integers greater than zero. The first number,
    `orderX`, indicates the number of columns in the matrix. The second number,
    `orderY`, indicates the number of rows in the matrix.

    A typical value is order="3". It is recommended that only small values
    (e.g., 3) be used; higher values may result in very high CPU overhead and
    usually do not produce results that justify the impact on performance.

    If the attribute is not specified, the effect is as if a value of 3 were
    specified.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/order
-}
order : number -> number -> Attribute a
order orderX orderY =
    Attr.order <| (toString orderX) ++ " " ++ (toString orderY)


{-|
    The `overlinePosition` attribute represents the ideal vertical position of
    the overline. The overline position is expressed in the font's coordinate
    system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlinePosition
-}
overlinePosition : number -> Attribute a
overlinePosition position =
    Attr.overlinePosition <| toString position


{-|
    The `overlineThickness` attribute represents the ideal thickness of
    the overline. The overline position is expressed in the font's coordinate
    system.

    Used by Elements: fontFace

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overlineThickness
-}
overlineThickness : number -> Attribute a
overlineThickness thickness =
    Attr.overlineThickness <| toString thickness


{-|
    This attribute lets the author specify a total length for the path, in user
    units. This value is then used to calibrate the browser's distance
    calculations with those of the author, by scaling all distance computations
    using the ratio pathLength / (computed value of path length).

    Used by Elements: path

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/path
-}
pathLength : number -> Attribute a
pathLength length =
    Attr.pathLength <| toString length


{-|
    The `patternContentUnits` attribute defines the coordinate system for the
    contents of the `pattern`. Note that this attribute has no effect if
    attribute viewBox is specified on the `pattern` element.

    If the `patternContentUnits` attribute isn't specified, then the effect is
    as if a value of CoordinateSystemUserSpaceOnUse were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternContentUnits
-}
patternContentUnits : CoordinateSystem -> Attribute a
patternContentUnits coordinateSystem =
    Attr.patternContentUnits <| coordinateSystemToString coordinateSystem


{-|
    The `patternTransform` attribute contains the definition of an optional
    additional transformation from the pattern coordinate system onto the target
    coordinate system. This allows for things such as skewing the pattern tiles.
    This additional transformation matrix is post-multiplied to (i.e., inserted
    to the right of) any previously defined transformations, including the
    implicit transformation necessary to convert from object bounding box units
    to user space.

    If attribute `patternTransform` is not specified, then the effect is as if
    an identity transform were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternTransform
-}
patternTransform : List Transform -> Attribute a
patternTransform transforms =
    Attr.patternTransform <| String.join " " (List.map transformToString transforms)


{-|
    The `patternUnits` attribute defines the coordinate system for attributes
    x, y, width and height.

    If the `patternUnits` attribute isn't specified, then the effect is as if a
    value of CoordinateSystemObjectBoundingBox were specified.

    Used by Elements: pattern

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternUnits
-}
patternUnits : CoordinateSystem -> Attribute a
patternUnits coordinateSystem =
    Attr.patternUnits <| coordinateSystemToString coordinateSystem


{-|
    The points attribute defines a list of points required to draw a `polyline`
    or `polygon` element.

    Each point is defined by an X and a Y coordinate (pair) in the user
    coordinate system.

    Used by Elements: polyline, polygon

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points
-}
points : List ( number, number ) -> Attribute a
points pts =
    let
        pointToString ( x, y ) =
            (toString x) ++ ", " ++ (toString y)
    in
        Attr.points <| String.join " " (List.map pointToString pts)


{-|
    The `pointsAtX` attribute represent the X location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtX
-}
pointsAtX : number -> Attribute a
pointsAtX lightSourceX =
    Attr.pointsAtX <| toString lightSourceX


{-|
    The `pointsAtY` attribute represent the Y location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtY
-}
pointsAtY : number -> Attribute a
pointsAtY lightSourceY =
    Attr.pointsAtY <| toString lightSourceY


{-|
    The `pointsAtZ` attribute represents the Z location in the coordinate system
    established by attribute primitiveUnits on the `filter` element of the point
    at which the light source is pointing.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feSpotlight

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointsAtZ
-}
pointsAtZ : number -> Attribute a
pointsAtZ lightSourceZ =
    Attr.pointsAtZ <| toString lightSourceZ


{-|
    The `preserveAlpha` attribute indicates how an `feConvolveMatrix` element
    handles alpha transparency.

    A value of false indicates that the convolution matrix will apply to all
    channels, including the alpha channel. This is the default value.

    A value of true indicates that the convolution matrix will only apply to the
    color channels.

    Used by Elements: feConvolveMatrix

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAlpha
-}
preserveAlpha : Bool -> Attribute a
preserveAlpha applyOnlyToColorChannels =
    Attr.preserveAlpha <| boolToString applyOnlyToColorChannels


preserveAspectRatio : AlignOption -> MeetOrSliceOption -> Attribute a
preserveAspectRatio alignOption meetOrSliceOption =
    let
        a =
            case alignOption of
                AlignNone ->
                    "none"

                Align x y ->
                    "x" ++ (scaleToString x) ++ "y" ++ (scaleToString y)

        b =
            case meetOrSliceOption of
                Meet ->
                    "meet"

                Slice ->
                    "slice"
    in
        Attr.preserveAspectRatio <| String.join " " [ a, b ]


type AlignOption
    = Align ScaleOption ScaleOption
    | AlignNone


type ScaleOption
    = ScaleMin
    | ScaleMid
    | ScaleMax


scaleToString : ScaleOption -> String
scaleToString scaleOption =
    case scaleOption of
        ScaleMin ->
            "min"

        ScaleMid ->
            "mid"

        ScaleMax ->
            "max"


type MeetOrSliceOption
    = Meet
    | Slice


{-|
    The `primitiveUnits` attribute specifies the coordinate system for the
    various length values within the `filter` primitives and for the attributes
    that define the filter primitive subregion.

    If the `primitiveUnits` attribute isn't specified, then the effect is as if
    a value of CoordinateSystemUserSpaceOnUse were specified.

    Used by Elements: filter

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/primitiveUnits
-}
primitiveUnits : CoordinateSystem -> Attribute a
primitiveUnits coordinateSystem =
    Attr.primitiveUnits <| coordinateSystemToString coordinateSystem


{-|
    The `radius` attribute represent the radius for the operation on a given
    `femorphology` filter primitive. The values are in the coordinate system
    established by the `primitiveUnits` attribute on the `filter` element.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feMorphology

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/radius
-}
radius : number -> number -> Attribute a
radius xRadius yRadius =
    Attr.radius <| (toString xRadius) ++ " " ++ (toString yRadius)


{-|
    This attribute indicates the number of times the animation will take place.

    The number can be a partial iteration, expressed as a fraction. Its value
    must be greater than 0.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatCount
-}
repeatCount : RepeatCount -> Attribute a
repeatCount repeatCount =
    Attr.repeatCount <|
        case repeatCount of
            RepeatCount count ->
                toString count

            RepeatIndefinite ->
                "indefinite"


type RepeatCount
    = RepeatCount Float
    | RepeatIndefinite


{-|
    This attribute specifies the total duration for repeat.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatDur
-}
repeatDur : DurationValue -> Attribute a
repeatDur duration =
    Attr.repeatDur <| durationToString duration


{-|
    This attribute takes a list of feature strings. It determines whether or not
    all of the named features are supported by the browser; if all of them are
    supported, the attribute evaluates to true end the element is rendered;
    otherwise, the attribute evaluates to false and the current element and its
    children are skipped and thus will not be rendered. This provides a way to
    design SVG that gracefully falls back when features aren't available.

    If the attribute is not present, then its implicit evaluated value is true.
    If a null string or empty string value is given to attribute
    `requiredFeatures`, the attribute is evaluate to false.

    `requiredFeatures` is often used in conjunction with the `switch` element.
    If `requiredFeatures` is used in other situations, it represents a simple
    switch on the given element whether to render the element or not.

    Used by Elements: a, altGlyph, animate, animateColor, animateMotion,
        animateTransform, circle, clipPath, cursor, defs, discard, ellipse,
        foreignObject, g, image, line, mask, mesh, mpath, path, pattern,
        polygon, polyline, rect, set, svg, switch, text, textPath, tref,
        tspan, use

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures
-}
requiredFeatures : List String -> Attribute a
requiredFeatures features =
    Attr.requiredFeatures <| String.join " " features


{-|
    This attribute indicates when animation can or can not restart.

    Used by Elements: animate, animateColor, animateMotion, animateTransform,
        discard, mpath, set

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/restart
-}
restart : RestartOption -> Attribute a
restart option =
    Attr.restart <|
        case option of
            RestartAlways ->
                "always"

            RestartWhenNotActive ->
                "whenNotActive"

            RestartNever ->
                "never"


type RestartOption
    = RestartAlways
    | RestartWhenNotActive
    | RestartNever


{-|
    The `result` attribute defines the assigned name for this filter primitive.
    If supplied, then graphics that result from processing this filter primitive
    can be referenced by an in attribute on a subsequent filter primitive within
    the same `filter` element.

    If no value is provided, the output will only be available for re-use as the
    implicit input into the next filter primitive if that filter primitive
    provides no value for its in attribute.

    Used by Elements: feBlend, feColorMatrix, feComponentTransfer, feComposite,
        feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feDropShadow,
        feFlood,feFuncA, feFuncB, feFuncG, feFuncR,feGaussianBlur, feImage,
        feMerge, feMergeNode, feMorphology, feOffset, feSpecularLighting,
        feTile, feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/result
-}
result : String -> Attribute a
result reference =
    Attr.result <| reference


{-|
    The `scale` attribute define the displacement scale factor to be used on a
    `feDisplacementMap` filter primitive. The amount is expressed in the
    coordinate system established by the `primitiveUnits` attribute on the
    `filter` element.

    When the value of this attribute is 0, this operation has no effect on the
    source image.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feDisplacementMap

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/scale
-}
scale : number -> Attribute a
scale value =
    Attr.scale <| toString value


{-|
    The seed attribute represents the starting number for the pseudo random
    number generator of the `feTurbulence` primitive.

    If the attribute is not specified, then the effect is as if a value of 0
    were specified.

    Used by Elements: feTurbulence

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/seed
-}
seed : number -> Attribute a
seed value =
    Attr.seed <| toString value


{-|
    The creator of SVG content might want to provide a hint about what tradeoffs
    to make as the browser renders `path` element or basic shapes. The
    shape-rendering attribute provides these hints.

    Used by Elements: circle, ellipse, line, mesh, path, polygon, polyline,
        rect, svg

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/shapeRendering
-}
shapeRendering : ShapeRenderingOption -> Attribute a
shapeRendering option =
    Attr.shapeRendering <|
        case option of
            RenderAuto ->
                "auto"

            RenderOptimizeSpeed ->
                "optimizeSpeed"

            RenderCrispEdges ->
                "crispEdges"

            RenderGeometricPrecision ->
                "geometricPrecision"

            RenderInherit ->
                "inherit"


type ShapeRenderingOption
    = RenderAuto
    | RenderOptimizeSpeed
    | RenderCrispEdges
    | RenderGeometricPrecision
    | RenderInherit


{-|
    The style attribute specifies style information for its element. It
    functions identically to the style attribute in HTML.

    Used by Elements: a, altGlyph, altGlyphDef, altGlyphItem, circle, clipPath,
        defs, defs, ellipse, feBlend, feColorMatrix, feComponentTransfer,
        feComposite, feConvolveMatrix, feDiffuseLighting, feDisplacementMap,
        feDropShadow, feFlood, feFuncA, feFuncB, feFuncG, feFuncR,
        feGaussianBlur, feImage, feMerge, feMergeNode, feMorphology, feOffset,
        feSpecularLighting, feTile, feTurbulence, filter, font, foreignObject,
        g, glyph, glyph, glyphRef, glyphRef, image, line, linearGradient,
        marker, mask, mesh, meshGradient, missingGlyph, path, pattern, polygon,
        polyline, radialGradient, rect, stop, svg, svg, switch, symbol, symbol,
        text, text, textPath, tref, tspan, use, use

    TODO: easy use of a typed CSS library?

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style
-}
style : String -> Attribute a
style value =
    Attr.style <| value


{-|
    The `surfaceScale` attribute represents the height of the surface for a
    light filter primitive.

    If the attribute is not specified, then the effect is as if a value of 1
    were specified.

    Used by Elements: feDiffuseLighting, feSpecularLighting

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/surfaceScale
-}
surfaceScale : number -> Attribute a
surfaceScale value =
    Attr.surfaceScale <| toString value


{-|
    Template

    Used by Elements:

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
svgBox : ( number, number ) -> List (Svg msg) -> Html msg
svgBox ( width, height ) =
    svg [ viewBox 0 0 800 600 ]


viewBox : number -> number -> number -> number -> Attribute a
viewBox minX minY width height =
    [ minX, minY, width, height ]
        |> List.map toString
        |> String.join " "
        |> Attr.viewBox


stroke : Color -> Attribute a
stroke color =
    Attr.stroke (colorToCssRgba color)


fill : Color -> Attribute a
fill color =
    Attr.fill (colorToCssRgba color)


noFill : Attribute a
noFill =
    fill (Color.rgba 0 0 0 0.0)


{-| An empty list will set `font-family: inherit`
-}
fontFamily : List String -> Attribute a
fontFamily families =
    case families of
        [] ->
            Attr.fontFamily "inherit"

        _ ->
            Attr.fontFamily (String.join ", " families)


type AnchorAlignment
    = AnchorInherit
    | AnchorStart
    | AnchorMiddle
    | AnchorEnd


textAnchor : AnchorAlignment -> Attribute a
textAnchor alignment =
    Attr.textAnchor <|
        case alignment of
            AnchorInherit ->
                "inherit"

            AnchorStart ->
                "start"

            AnchorMiddle ->
                "middle"

            AnchorEnd ->
                "end"



{- Attributes that express Lengths -}


cx : Length -> Attribute a
cx length =
    Attr.cx <| lengthToString length


cy : Length -> Attribute a
cy length =
    Attr.cy <| lengthToString length


dx : Length -> Attribute a
dx length =
    Attr.dx <| lengthToString length


dy : Length -> Attribute a
dy length =
    Attr.dy <| lengthToString length


fontSize : Length -> Attribute a
fontSize length =
    Attr.fontSize <| lengthToString length


{-|
    For the `radialGradient` element, this attribute defines the x-axis
    coordinate of the focal point for the radial gradient.

    If the attribute is not specified, it's assumed to be at the same place as
    the center point.

    Used by Elements: radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
fx : Length -> Attribute a
fx length =
    Attr.fx <| lengthToString length


{-|
    For the `radialGradient` element, this attribute defines the y-axis
    coordinate of the focal point for the radial gradient.

    If the attribute is not specified, it's assumed to be at the same place as
    the center point.

    Used by Elements: radialGradient

    See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/
-}
fy : Length -> Attribute a
fy length =
    Attr.fy <| lengthToString length


rx : Length -> Attribute a
rx length =
    Attr.rx <| lengthToString length


ry : Length -> Attribute a
ry length =
    Attr.ry <| lengthToString length


r : Length -> Attribute a
r length =
    Attr.r <| lengthToString length


strokeWidth : Length -> Attribute a
strokeWidth length =
    Attr.strokeWidth <| lengthToString length


width : Length -> Attribute a
width length =
    Attr.width <| lengthToString length


height : Length -> Attribute a
height length =
    Attr.height <| lengthToString length


x : Length -> Attribute a
x length =
    Attr.x <| lengthToString length


y : Length -> Attribute a
y length =
    Attr.y <| lengthToString length
