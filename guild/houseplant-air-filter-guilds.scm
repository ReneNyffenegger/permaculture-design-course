(require-extension defstruct extras amb amb-extras)

;;;; problem statement:
;;;;
;;;; I would like to find arrangements of 3 house plants, such that
;;;; the arragements have similar water, light needs, compatible
;;;; growing habits, while filtering all tested-for VOCs.
;;;;
;;;; sources: How To Grow Fresh Air by Dr. B.C. Wolverton
;;;;          The Houseplant Encyclopedia by Maggie Stuckey
;;;;          http://houseplants-care.blogspot.com/
;;;;          http://en.wikipedia.org/wiki/List_of_air-filtering_plants
;;;;

;; define the attributes of our house plants
;;
(defstruct plant en-name
                 la-name

                 ;;
                 ;; habit:
                 ;;
                 habit

                 ;;
                 ;; humidity
                 ;;
                 humidity

                 ;;
                 ;; lighting:
                 ;;   shade
                 ;;   semi-shade
                 ;;   semi-sun
                 ;;   full-sun
                 ;;
                 ;; Source: How to Grow Fresh Air, pg. 32-33.
                 ;;
                 light


                 ;;
                 ;; temperature
                 ;;
                 ;; (min max)
                 ;;
                 temperature-min
                 temperature-max

                 ;;
                 ;; watering:
                 ;;
                 ;;   low
                 ;;   low-moderate
                 ;;   high-moderate
                 ;;   heavy
                 ;;
                 water

                 ;;
                 ;; VOCs:
                 ;;   true or false
                 ;;
                 benzene
                 formaldehyde
                 trichloroethylene
                 xylene+toluene
                 ammonia

                 ;;
                 ;; poison:
                 ;;
                 ;;  cat
                 ;;  children
                 ;;  dog
                 ;;  poisonous
                 ;;  unknown
                 ;;
                 poisonous

                 ;;
                 ;; references
                 ;;
                 page-houseplant-encyclopedia
                 page-how-to-grow-fresh-air)


;;;
;;; the plant data
;;;

; http://houseplants-care.blogspot.com/2006/11/areca-palm-care.html
(set! areca-palm
      (make-plant en-name:          "Areca palm"
                  ; also called a Butterfly Palm, Golden Feather Palm
                  la-name:          "Chrysalidocarpus lutescens"
                  habit:            'tree
                  water:            'heavy
                  water:            "top layer lighty moist"
                  light:            'semi-sun
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 76
                  page-how-to-grow-fresh-air:   40))
; http://houseplants-care.blogspot.com/2007/05/lady-palms-care.html
(set! lady-palm
      (make-plant en-name:          "Lady Palm"
                  ; also called a Little Lady Palm, Bamboo Palm
                  la-name:          "Rhapis excelsa"
                  habit:            'tree
                  water:            'low-moderate
                  water:            "top layer lighty moist"
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  70
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #t
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 150
                  page-how-to-grow-fresh-air:   42))
(set! bamboo-palm
      (make-plant en-name:          "Bamboo palm"
                  la-name:          "Chamaedorea seifrizii"
                  habit:            'tree
                  water:            'heavy
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   44))
; http://houseplants-care.blogspot.com/2006/07/rubber-plant-care.html
(set! rubber-plant
      (make-plant en-name:          "Rubber Plant"
                  ; also called a Indian Rubber Plant
                  la-name:          "Ficus robusta"
                  habit:            'tree
                  water:            'heavy
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  80
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 216
                  page-how-to-grow-fresh-air:   46))
; See Also: Corn Plant,
;           Dracaena "Janet Craig",
;           Dracaena "Warneckei",
;           Dragon Tree
(set! dracaena-janet-craig
      (make-plant en-name:          "Dracaena \"Janet Craig\""
                  ; also called a Dragon Plant, Ribbon Plant, Striped Dracaena
                  la-name:          "Dracaena deremensis \"Janet Craig\""
                  ; also called a Dracaena fragrans
                  habit:            'tree
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(dogs)
                  page-houseplant-encyclopedia: 100
                  page-how-to-grow-fresh-air:   48))
(set! english-ivy
      (make-plant en-name:          "English Ivy"
                  ; Also called Green Ivy.
                  la-name:          "Hedera helix"
                  habit:            'vine
                  ; XXX: unsourced
                  water:            'high-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  70
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 110
                  page-how-to-grow-fresh-air:   50))
(set! dwarf-date-palm
      (make-plant en-name:          "Dwarf date palm"
                  la-name:          "Phoenix roebelenii"
                  habit:            'tree
                  water:            'XXX
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   52))
; XXX: ficus Alii
; http://houseplants-care.blogspot.com/2007/10/boston-fern-care.html
(set! boston-fern
      (make-plant en-name:          "Boston fern"
                  ; also called a Ladder Fern or Sword Fern
                  la-name:          "Nephrolepis exaltata \"Bostoniensis\""
                  habit:            'bush
                  ; XXX: also moderate, allow option
                  water:            'heavy
                  light:            'semi-sun
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 64
                  page-how-to-grow-fresh-air:   56))
; http://houseplants-care.blogspot.com/2006/10/peace-lily-care.html
(set! peace-lily
      (make-plant en-name:          "Peace lily"
                  ; also called a White flag, White sails, or Spath flower
                  la-name:          "Spathiphyllum sp."
                  habit:            'bush
                  water:            'heavy
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #t
                  xylene+toluene:   #t
                  ammonia:          #t
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 171
                  page-how-to-grow-fresh-air:   58))
; http://houseplants-care.blogspot.com/2006/05/corn-plant-care.html
; See Also: Dracaena "Janet Craig",
;           Dracaena "Warneckei",
;           Dragon Tree
(set! corn-plant
      (make-plant en-name:          "Corn plant"
                  la-name:          "Dracaena fragans \"Massangeana\""
                  habit:            'tree
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 93
                  page-how-to-grow-fresh-air:   60))
(set! golden-pothos
      (make-plant en-name:          "Golden pothos"
                  ; also called Devil's Ivy, Golden Hunter's Robe,
                  ; Geylon Creeper.
                  la-name:          "Epipremnum aureum"
                  ; archaeic: Scindapsus aureus, Rhaphidophora aurea
                  habit:            'vine
                  water:            'low-moderate
                  light:            'shade
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(poisonous)
                  page-houseplant-encyclopedia: 193
                  page-how-to-grow-fresh-air:   62))
(set! kimberly-queen
      (make-plant en-name:          "Kimberly queen"
                  la-name:          "Nephrolepis obliterata"
                  habit:            'bush
                  water:            'XXX
                  light:            'semi-shade
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   64))
(set! pot-mum
      (make-plant en-name:          "Pot Mum"
                  ; also called Florist's Mum
                  la-name:          "Chrysanthemum morifolium"
                  habit:            'bush
                  water:            'XXX
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  65
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #t
                  xylene+toluene:   #t
                  ammonia:          #t
                  poisonous:        '(cats dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   66))
(set! gerbera-daisy
      (make-plant en-name:          "Gerbera Daisy"
                  la-name:          "Gerbera jamesonii"
                  habit:            'bush
                  water:            'XXX
                  light:            'full-sun
                  temperature-min:  60
                  temperature-max:  65
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #t
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   68))
; http://houseplants-care.blogspot.com/2007/01/warneckei-plant-care.html
;
; See Also: Corn Plant,
;           Dracaena "Janet Craig",
;           Dragon Tree
(set! dracaena-warneckei
      (make-plant en-name:          "Dracaena \"Warneckei\""
                  ; also called a Dragon Plant, Ribbon Plant, Striped Dracaena
                  la-name:          "Dracaena deremensis \"Warneckei\""
                  habit:            'bush
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #t
                  formaldehyde:     #f
                  trichloroethylene: #t
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: 100
                  page-how-to-grow-fresh-air:   70))
; See Also: Corn Plant,
;           Dracaena "Janet Craig",
;           Dracaena "Warneckei",
(set! dragon-tree
      (make-plant en-name:          "Dragon Tree"
                  la-name:          "Dracaena marginata"
                  habit:            'tree
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #t
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(cats dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   72))
; XXX: Red Emerald Philodendron
; XXX: Syngonium
(set! dumb-cane-exotica
      (make-plant en-name:          "Dumb Cane (Exotica)"
                  la-name:          "Dieffenbachia \"Exotica Compacta\""
                  habit:            'bush
                  water:            'high-moderate
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  80
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(cats children dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   78))
; XXX: parlor palm
(set! weeping-fig
      (make-plant en-name:          "Weeping Fig"
                  la-name:          "Ficus benjamina"
                  habit:            'tree
                  water:            'high-moderate
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(cats dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   82))
; XXX: Schefflera
; XXX: Wax Begonia
; XXX: Lacy Tree Philodendron
; http://houseplants-care.blogspot.com/2007/01/heart-leaf-philodendron-plant-care.html
(set! heart-leaf-philodendron
      (make-plant en-name:          "Heartleaf philodendron"
                  la-name:          "Philodendron oxycardium"
                  ; also called Philodendron scandens
                  habit:            'vine
                  ; XXX: I consider this contradicted in the source text.
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  70
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   90))
(set! snake-plant
      (make-plant en-name:          "Snake plant"
                  la-name:          "Sansevieria trifasciata"
                  habit:            'tree
                  water:            'high-moderate
                  light:            'semi-shade
                  temperature-min:  65
                  temperature-max:  80
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #t
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(cats dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   92))
(set! dumb-cane-camilla
      (make-plant en-name:          "Dumb Cane (Camilla)"
                  la-name:          "Dieffenbachia camilla"
                  habit:            'bush
                  water:            'high-moderate
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  85
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(cats children dogs)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   94))
(set! elephant-ear-philodendron
      (make-plant en-name:          "Elephant ear philodendron"
                  la-name:          "Philodendron domesticum or Philodendron tuxla"
                  habit:            'vine
                  ; XXX: no source
                  water:            'high-moderate
                  light:            'shade
                  temperature-min:  60
                  temperature-max:  70
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   96))
; XXX: Norfolk Island Pine
(set! king-of-hearts
      (make-plant en-name:          "King of Hearts"
                  la-name:          "Homalomena wallisii"
                  habit:            'bush
                  water:            'XXX
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   100))
; XXX: Prayer Plant
; XXX: Dwarf Banana
; XXX: Christmas and Easter Cactus
; XXX: Oakleaf Ivy
(set! lily-turf
      (make-plant en-name:          "Lily Turf"
                  la-name:          "Liriope spicata"
                  habit:            'bush
                  water:            'XXX
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #t
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   110))
(set! dendrobium-orchid
      (make-plant en-name:          "Dendrobium orchid"
                  la-name:          "Dendrobium sp."
                  habit:            'bush
                  water:            'low
                  light:            'semi-sun
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   112))
(set! spider-plant
      (make-plant en-name:          "Spider Plant"
                  la-name:          "Chlorophytum comosum \"Vittatum\""
                  habit:            'bush
                  water:            'low
                  light:            'semi-shade
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   114))
(set! chinese-evergreen
      (make-plant en-name:          "Chinese Evergreen"
                  la-name:          "Aglaonema crispum \"Silver Queen\""
                  habit:            'bush
                  water:            'low-moderate
                  light:            'shade
                  temperature-min:  60
                  temperature-max:  75
                  benzene:          #t
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(poisonous-fruit)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   116))
; Also called Flamingo/Flaming Lily?
(set! anthurium
      (make-plant en-name:          "anthurium"
                  la-name:          "Anthurium andraeanum"
                  habit:            'bush
                  water:            'XXX
                  light:            'semi-sun
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #t
                  poisonous:        '(poisonous)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   118))
; XXX: Croton
; XXX: Poinsettia
; XXX: Dwarf Azalea
; XXX: Peacock Plant
(set! aloe-vera
      (make-plant en-name:          "Aloe Vera"
                  la-name:          "Aloe barbadensis"
                  habit:            'bush
                  water:            'low
                  light:            'full-sun
                  temperature-min:  65
                  temperature-max:  75
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   128))
; XXX: Cyclamen
; XXX: Urn Plant
; XXX: Tulip
(set! moth-orchid
      (make-plant en-name:          "Moth Orchid"
                  la-name:          "Phalenopsis sp."
                  habit:            'bush
                  water:            'low
                  light:            'semi-shade
                  temperature-min:  70
                  temperature-max:  80
                  benzene:          #f
                  formaldehyde:     #f
                  trichloroethylene: #f
                  xylene+toluene:   #t
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   136))
; XXX: Kalanchoe
(set! lacy-tree-philodendron
      (make-plant en-name:          "Lacy Tree Philodendron"
                  la-name:          "Philodendron selloum"
                  habit:            'tree
                  ; XXX: no source
                  water:            'low-moderate
                  light:            'semi-shade
                  temperature-min:  60
                  temperature-max:  70
                  benzene:          #f
                  formaldehyde:     #t
                  trichloroethylene: #f
                  xylene+toluene:   #f
                  ammonia:          #f
                  poisonous:        '(unknown)
                  page-houseplant-encyclopedia: '()
                  page-how-to-grow-fresh-air:   88))


;;;
;;; helper routines
;;;
;;;  we have any number of constraints we might express:
;;;    + all plants must have a matching attribute value.
;;;    + all plants must have a distinct attribute value.
;;;    + all plants must have an overlapping attribute range.
;;;
;;;  I hope to flesh out this set of constraints as I further work on
;;;  problems in this space.
;;;

;; map-apply
;;
(define (pairwise l)
  (zip l (cdr l)))

(define-syntax map-apply
  (syntax-rules ()
    ((_ f l) (map (lambda (x) (apply f x)) l))))

(define-syntax all-eq?
  (syntax-rules ()
    ((_ l) (every identity (map-apply eq? (pairwise l))))))


;;;
;;; the constraint solver itself.
;;;
(define (enumerate-guild)
  (let* ((slot0 (amb areca-palm
                     lady-palm
                     bamboo-palm
                     rubber-plant
                     dracaena-janet-craig
                     english-ivy
                     dwarf-date-palm
                     boston-fern
                     peace-lily
                     corn-plant
                     golden-pothos
                     kimberly-queen
                     pot-mum
                     gerbera-daisy
                     dracaena-warneckei
                     dragon-tree
                     dumb-cane-exotica
                     weeping-fig
                     heart-leaf-philodendron
                     snake-plant
                     dumb-cane-camilla
                     elephant-ear-philodendron
                     king-of-hearts
                     lily-turf
                     dendrobium-orchid
                     spider-plant
                     chinese-evergreen
                     anthurium
                     aloe-vera
                     moth-orchid
                     lacy-tree-philodendron))
         (slot1 (amb areca-palm
                     lady-palm
                     bamboo-palm
                     rubber-plant
                     dracaena-janet-craig
                     english-ivy
                     dwarf-date-palm
                     boston-fern
                     peace-lily
                     corn-plant
                     golden-pothos
                     kimberly-queen
                     pot-mum
                     gerbera-daisy
                     dracaena-warneckei
                     dragon-tree
                     dumb-cane-exotica
                     weeping-fig
                     heart-leaf-philodendron
                     snake-plant
                     dumb-cane-camilla
                     elephant-ear-philodendron
                     king-of-hearts
                     lily-turf
                     dendrobium-orchid
                     spider-plant
                     chinese-evergreen
                     anthurium
                     aloe-vera
                     moth-orchid
                     lacy-tree-philodendron))
         (slot2 (amb areca-palm
                     lady-palm
                     bamboo-palm
                     rubber-plant
                     dracaena-janet-craig
                     english-ivy
                     dwarf-date-palm
                     boston-fern
                     peace-lily
                     corn-plant
                     golden-pothos
                     kimberly-queen
                     pot-mum
                     gerbera-daisy
                     dracaena-warneckei
                     dragon-tree
                     dumb-cane-exotica
                     weeping-fig
                     heart-leaf-philodendron
                     snake-plant
                     dumb-cane-camilla
                     elephant-ear-philodendron
                     king-of-hearts
                     lily-turf
                     dendrobium-orchid
                     spider-plant
                     chinese-evergreen
                     anthurium
                     aloe-vera
                     moth-orchid
                     lacy-tree-philodendron))
          (slots (list slot0 slot1 slot2)))
 
    ; slot0 is for tree plants
    ;
    (required (eq? 'tree (plant-habit slot0)))

    ; slot1 is for bush plants
    ;
    (required (eq? 'bush (plant-habit slot1)))

    ; slot2 is for vine plants
    ;
    (required (eq? 'vine (plant-habit slot2)))

    ; make sure all plants have the same light needs
    ;
    (required (all-eq? (map plant-light slots)))

    ; make sure all plants have the same temperature needs.
    ; (i.e., all min temps below min(max) and all max temps
    ; above max(min))
    ;
    ; XXX: temperature check not implemented.


    ; make sure all plants have the same water needs
    ;
    ; XXX: water data is not reliable yet.  I find contradiction
    ;      between my sources.  I need to pull out the descriptive
    ;      terms used by each source and classify those texts along
    ;      a spectrum.  Time constraints did not permit me to
    ;      complete that work.
    ;
    ; (required (all-eq? (map plant-water slots)))

    ; make sure someone is filtering benzene
    ;
    (required (any identity (map plant-benzene slots)))

    ; make sure someone is filtering formaldehyde
    ;
    (required (any identity (map plant-formaldehyde slots)))

    ; make sure someone is filtering trichloroethylene
    ;
    (required (any identity (map plant-trichloroethylene slots)))

    ; make sure someone is filtering xylene+toluene
    ;
    (required (any identity (map plant-xylene+toluene slots)))

    ; make sure someone is filtering ammonia
    ;
    (required (any identity (map plant-ammonia slots)))

    ; remove poisonous plants
    ;
    ; XXX: Poison data is spotty: a plant not recorded as poisonous
    ;      is still likely poisonous.
    ;

    ; return the permutations
    ;
    slots))

; pretty-print each guild enumeration. 
;
(pretty-print
  (map (lambda (l) (map plant->alist l))
       (amb-collect (enumerate-guild))))
(exit)
