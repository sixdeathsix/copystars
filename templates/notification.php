<?php if(isset($_SESSION['message'])): ?>
    <style>
        #toast {
            visibility: hidden;
            min-width: 250px;
            background-color: black;
            color: white;
            padding: 20px;
            position: fixed;
            right: 30px;
            bottom: 30px;
            text-align: center;
        }

        #toast.show {
            visibility: visible;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }

    </style>
    <p id="toast" class="message"><?= $_SESSION['message']; ?></p>
    <?= '
        <script>
            function show() {
                let t = document.getElementById("toast");
                t.className = "show";
                setTimeout(() => t.className = t.className.replace("show", ""), 2000);
            }
            show();
            
            document.getElementById("toast").classList.add("show");
            setTimeout(() => document.getElementById("toast").classList.remove("show"), 2000);
        </script>
    ' ?>
<?php endif; unset($_SESSION['message']); ?>