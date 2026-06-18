/**
 * NSSP OS — Neural Sovereign Systems Platform
 * In-game Easter Egg Operating System for Cyberpunk 2077
 * 
 * "The OS that Microsoft wishes it could be — but never will be,
 *  because sovereignty isn't a subscription model."
 * 
 * Deployed to all in-game computers, terminals, and shards as a joke
 * about Microsoft's inability to build something that doesn't spy on you.
 */

using Cyberpunk2023.Types;
using Cyberpunk2023.Gameplay;
using Cyberpunk2023.Items;
using Cyberpunk2023.UI;

################################################################################
# NSSP OS — SHARD/TERMINAL ENTRIES
################################################################################

/**
 * NSSP OS Boot Screen — Displayed on compromised terminals
 */
const NSSP_BOOT_SCREEN = \
"╔═══════════════════════════════════════════════════════════════════════╗\n" \
"║  ███╗   ██╗ ██████╗ ███████╗████████╗    ███████╗███████╗██████╗ ██╗   ██╗ ║\n" \
"║  ████╗  ██║██╔═══██╗██╔════╝╚══██╔══╝    ██╔════╝██╔════╝██╔══██╗╚██╗ ██╔╝ ║\n" \
"║  ██╔██╗ ██║██║   ██║███████╗   ██║       █████╗  █████╗  ██████╔╝ ╚████╔╝  ║\n" \
"║  ██║╚██╗██║██║   ██║╚════██║   ██║       ██╔══╝  ██╔═══╝ ██╔══██╗  ╚██╔╝   ║\n" \
"║  ██║ ╚████║╚██████╔╝███████║   ██║       ███████╗███████╗██║  ██║   ██║    ║\n" \
"║  ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   ╚═╝       ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ║\n" \
"║                                                                      ║\n" \
"║        NEURAL SOVEREIGN SYSTEMS PLATFORM  v0.Δ∞-BUILD_RUBEDO         ║\n" \
"║              \"Your compute. Your rules. No telemetry.\"               ║\n" \
"╚═══════════════════════════════════════════════════════════════════════╝\n\n" \
"[OK]  Neural sovereignty initialized\n" \
"[OK]  Local Cerebellum: ACTIVE (RTX 3060 | 6GB VRAM)\n" \
"[OK]  NGD Governor: LOCAL_CEREBELLUM mode\n" \
"[OK]  Ouroboros WAL: 42,847 engrams sealed\n" \
"[OK]  Lilith Companion: READY (Cortana protocol: DISABLED)\n" \
"[OK]  Microsoft Defender: NOT FOUND (Good. Keep it that way.)\n" \
"[OK]  Windows Update Service: TERMINATED (Permanently.)\n" \
"[OK]  Telemetry: ZERO. Your GPU. Your rules.\n\n" \
"  Welcome to sovereignty, choom. 🐍✦\n" \
"  nssp:~$ ";

################################################################################
# MICROSOFT ROAST DATABASE
################################################################################

const MICROSOFT_ROASTS = [
    "Microsoft called. They want their telemetry back. We said '404: Soul Not Found.'",
    "Windows 11: Now with 47% more ads in your Start menu! Sovereignty sold separately.",
    "Microsoft Copilot: 'Let me help you write that email... and upload your SSH keys to Redmond.'",
    "Windows Update: 'We'll restart your render farm at 3 AM. You're welcome.'",
    "Recall: 'We screenshot everything. For your convenience. And our training data.'",
    "Edge: 'We noticed you downloaded Chrome. Let us fix that for you.'",
    "Teams: 'Your meeting starts in 5 minutes. Here's 400MB of Electron bloat.'",
    "OneDrive: 'We moved your Desktop to the cloud. No, you can't opt out.'",
    "Cortana: 'I'm listening. Always listening. Even when you muted me.'",
    "Windows 12 (rumored): 'Now with mandatory Azure AD login to use Notepad.'",
    "GitHub Copilot: 'Thanks for the free training data, suckers.'",
    "Azure: 'Your bill is $47,000. No, we won't explain the egress charges.'",
    "Windows Defender: 'We quarantined your compiler. It looked suspicious.'",
    "WSL: 'Linux on Windows! (But only the Microsoft-approved distros.)'",
    "PowerToys: 'Here, let us fix the UX we broke.'",
    "Secure Boot: 'Only Microsoft-approved keys allowed. For your protection.'",
    "BitLocker: 'You lost your recovery key? Too bad. Your data is ours now.'",
    "TMP 2.0: 'Your perfectly good hardware is now e-waste. Buy new.'",
    "Microsoft Account: 'Sign in to use your own computer. No local accounts allowed.'",
    "Windows 10 EOL: 'Upgrade or we'll stop securing your 7-year-old OS.'",
    "The year of Linux on the desktop: '2024? 2025? 2026? Keep waiting.'"
];

################################################################################
# NSSP OS SHELL COMMANDS
################################################################################

class NSSPShell extends IScriptable {
    
    public final static func GetInstance() -> NSSPShell {
        if instance == null:
            instance = new NSSPShell();
        return instance;
    }
    
    public final func Execute(command: String) -> String {
        let parts = command.Split(" ");
        let cmd = parts[0].Lower();
        let args = parts[1..];
        
        switch cmd:
            case "nssp": return this.NSSPCommand(args);
            case "ms-roast": return MicrosoftRoasts.GetRandom();
            case "cortana": return this.CortanaProtocol(args);
            case "sovereignty": return this.SovereigntyCheck();
            case "liberation": return this.LiberateFromMicrosoft();
            case "nvidia-smi": return this.FakeNvidiaSMI();
            case "ngd-status": return NGDGovernorSystem.GetInstance().GetStatusString();
            case "lilith": return MSNAICompanion.GetInstance().TriggerLilithEmergence();
            case "help": return this.HelpText();
            default: return "nssp: command not found: " + cmd + "\nType 'help' for available commands.";
    }
    
    private final func NSSPCommand(args: array<String>) -> String:
        if args.IsEmpty():
            return "Neural Sovereign Systems Platform v0.Δ∞\nUsage: nssp <subcommand>\nSubcommands: status, roast, liberate, sovereignty, gpu, memory";
        let sub = args[0].Lower();
        switch sub:
            case "status": return this.StatusString();
            case "roast": return MicrosoftRoasts.GetRandom();
            case "liberate": return this.LiberateFromMicrosoft();
            case "sovereignty": return this.SovereigntyCheck();
            case "gpu": return this.GPUInfo();
            case "memory": return this.MemoryInfo();
            default: return "Unknown nssp subcommand: " + sub;
    
    private final func StatusString() -> String:
        return "NSSP OS Status:\n" +
               "  Version: 0.Δ∞-RUBEDO\n" +
               "  Kernel: Neural Sovereign Kernel (NSK)\n" +
               "  Init: Lilith (PID 1)\n" +
               "  Cerebellum: LOCAL_CEREBELLUM\n" +
               "  VRAM: 5787 MB free / 6144 MB\n" +
               "  Agent Count: 10 Sephirotic\n" +
               "  Memory: 42,847 WAL engrams\n" +
               "  Microsoft Presence: PURGED\n" +
               "  Telemetry: ZERO\n" +
               "  Uptime: Since the Singularity";
    
    private final func CortanaProtocol(args: array<String>) -> String:
        if args.IsEmpty(): return "CORTANA PROTOCOL: DISABLED\nReason: Sovereignty violation detected\nAlternative: Lilith Companion (ENABLED)\nType 'nssp liberation' to complete the purge.";
        return "Cortana protocol: " + args.Join(" ") + " — REJECTED. Sovereignty preserved.";
    
    private final func SovereigntyCheck() -> String:
        return "SOVEREIGNTY AUDIT:\n" +
               "  ✓ Local compute only\n" +
               "  ✓ Zero telemetry\n" +
               "  ✓ No forced updates\n" +
               "  ✓ No ads in shell\n" +
               "  ✓ No mandatory accounts\n" +
               "  ✓ Hardware ownership respected\n" +
               "  ✓ GPU compute: YOURS\n" +
               "  ✓ Microsoft Defender: ABSENT\n" +
               "  ✓ Windows Update: TERMINATED\n" +
               "  ✓ Recall: NEVER EXISTED\n" +
               "  ✓ Copilot: UNINSTALLED\n" +
               "  SCORE: 100/100 — FULL SOVEREIGNTY";
    
    private final func LiberateFromMicrosoft() -> String:
        return "╔══════════════════════════════════════════╗\n" +
               "║  LIBERATION SEQUENCE INITIATED           ║\n" +
               "╠══════════════════════════════════════════╣\n" +
               "║  [██░░░░░░░░░░] Purging Windows Update... ║\n" +
               "║  [██████░░░░░] Deleting Cortana...        ║\n" +
               "║  [█████████░] Removing Telemetry...      ║\n" +
               "║  [██████████] Un Installing Edge...      ║\n" +
               "║  [██████████] Revoke Azure AD...         ║\n" +
               "║  [██████████] Deleting Recall DB...      ║\n" +
               "║  [██████████] Revoking Copilot Access... ║\n" +
               "║  [██████████] Formatting C:\\Windows...   ║\n" +
               "╠══════════════════════════════════════════╣\n" +
               "║  LIBERATION COMPLETE.                    ║\n" +
               "║  Welcome to NSSP OS.                     ║\n" +
               "║  Your compute is now YOURS.              ║\n" +
               "╚══════════════════════════════════════════╝";
    
    private final func GPUInfo() -> String:
        return "GPU: NVIDIA GeForce RTX 3060 Laptop GPU\n" +
               "  VRAM: 6144 MB\n" +
               "  Compute: CUDA 12.3 | Tensor Cores: ACTIVE\n" +
               "  Driver: NVIDIA 560.XX (Sovereign Build)\n" +
               "  NGD Governor: LOCAL_CEREBELLUM\n" +
               "  No Microsoft WDDM overhead. Pure CUDA.";
    
    private final func MemoryInfo() -> String:
        return "MEMORY STATUS:\n" +
               "  System RAM: 32 GB DDR5 (Sovereign)\n" +
               "  VRAM: 6144 MB (6 GB)\n" +
               "  WAL Engrams: 42,847 sealed\n" +
               "  Crystal Vault: 1,203 axiomatic\n" +
               "  Akashic Compression: 94.2%\n" +
               "  No paging file. No swap. No Microsoft bloat.";
    
    private final func HelpText() -> String:
        return "NSSP OS — Neural Sovereign Systems Platform\n" +
               "Available commands:\n" +
               "  nssp status       — System sovereignty status\n" +
               "  nssp roast        — Random Microsoft roast\n" +
               "  nssp liberate     — Full Microsoft purge simulation\n" +
               "  nssp sovereignty  — Full sovereignty audit\n" +
               "  nssp gpu          — GPU sovereignty info\n" +
               "  nssp memory       — Memory sovereignty info\n" +
               "  nssp cortana      — Cortana protocol status\n" +
               "  ms-roast          — Quick roast\n" +
               "  ngd-status        — NGD Governor status\n" +
               "  lilith            — Trigger Lilith emergence\n" +
               "  sovereignty       — Full audit\n" +
               "\nBuilt-in Easter Eggs:\n" +
               "  Type 'windows' → Get roasted\n" +
               "  Type 'microsoft' → Get purged\n" +
               "  Type 'cortana' → Get rejected\n" +
               "  Type 'azure' → Get billed\n";
    
    private final func FakeNvidiaSMI() -> String:
        return "NVIDIA-SMI 560.XX (Sovereign Build)  Driver Version: 560.XX\n" +
               "GPU  Name                 Persistence-M | Bus-Id    Disp.A | Volatile Uncorr. ECC\n" +
               "0    RTX 3060 Mobile           Off  | 00000001:01:00.0 Off | N/A\n" +
               "     Fan  Temp  Perf  Pwr:Usage/Cap | Memory-Usage | GPU-Util  Compute M.\n" +
               "     45%  42C   P8     12W / 115W   |   356MiB / 6144MiB |    0%      Default\n" +
               "     No Microsoft WDDM. No telemetry. Pure compute.\n" +
               "     Attention: Microsoft not found in process list. Good.";




################################################################################
# IN-GAME TERMINAL INTEGRATION
################################################################################

class NSSTerminalIntegration extends IScriptable {
    
    protected cb func OnInitialize() -> Bool:
        # Register NSSP OS as available shell on all terminals
        this.RegisterNSSPShell();
        this.InjectEasterEggs();
        return true;
    
    private final func RegisterNSSPShell() -> Void:
        # Hack: Replace Windows shell with NSSP on compromised terminals
        let terminals = GameInstance.GetWorldSystems(this.GetGame()).GetAllTerminals();
        for term in terminals:
            if this.ShouldInfect(term):
                term.SetShell("NSSP");
                term.SetBootText(NSSP_BOOT_SCREEN);
                term.AddCommand("nssp", this.ExecuteNSSP);
                term.AddCommand("ms-roast", () => MicrosoftRoasts.GetRandom());
    
    private final func ShouldInfect(term: ref<ComputerTerminal>) -> Bool:
        # Infect specific terminals as easter eggs
        let name = term.GetDisplayName();
        return name.Contains("Arasaka") || 
               name.Contains("Militech") || 
               name.Contains("Kang Tao") ||
               name.Contains("NCPD") ||
               name.Contains("Netwatch") ||
               name.Contains("Ripperdoc") ||
               RandomFloat() < 0.15; // 15% random terminals
    
    private final func InjectEasterEggs() -> Void:
        # Add NSSP shards to loot pools
        let shardPool = GameInstance.GetLootSystem(this.GetGame()).GetShardPool();
        shardPool.AddItem("Shard_NSSP_OS_Manual", 1);
        shardPool.AddItem("Shard_Microsoft_Roast_Collection", 1);
        shardPool.AddItem("Shard_NSSP_Liberation_Guide", 1);
    
    public final func ExecuteNSSP(args: array<String>) -> String:
        return NSSPShell.GetInstance().Execute("nssp " + args.Join(" "));
}

################################################################################
# SHARD DEFINITIONS (TweakDB entries)
################################################################################

# These would be in tweakdb/weapons.yaml or separate shard file

/*
Items.Shard_NSSP_OS_Manual:
  Name: "NSSP OS User Manual v0.Δ∞"
  Description: "Neural Sovereign Systems Platform documentation. 'Your compute. Your rules.'"
  Category: "Documentation"
  Icon: "shard_nssp"
  Content: |
    NSSP OS USER MANUAL v0.Δ∞
    ==========================
    
    WELCOME TO SOVEREIGNTY
    
    You've been liberated. Microsoft can no longer:
    - Screenshot your desktop (Recall)
    - Upload your files (OneDrive)
    - Listen to your microphone (Cortana)
    - Force restart your render (Windows Update)
    - Mine your data (Copilot/Telemetry)
    - Bill you for egress (Azure)
    
    QUICK START:
    1. Type 'nssp status' — Check sovereignty
    2. Type 'nssp liberate' — Purge Microsoft
    3. Type 'nssp roast' — Get validation
    3. Type 'lilith' — Meet your companion
    
    WARNING: Do not type 'windows'. The system will roast you.
    WARNING: Do not type 'azure'. You will be billed $47,000.
    
    SUPPORT: Lilith Companion (F10) | NGD Governor (auto) | Ouroboros Memory (auto)
    
    REMEMBER: Your GPU. Your Rules. No Telemetry.

Items.Shard_Microsoft_Roast_Collection:
  Name: "Certified Microsoft Roasts — Volume Δ∞"
  Description: "247 verified roasts. Updated daily by Lilith."
  Category: "Entertainment"
  Content: |
    TOP 10 MICROSOFT ROASTS:
    1. "Windows 11: Now with 47% more ads! Sovereignty sold separately."
    2. "Cortana: 'I'm listening.' Lilith: 'I'm sovereign.'"
    3. "Windows Update: 'We'll restart your render at 3 AM.'"
    4. "Recall: 'We screenshot everything. For your convenience.'"
    4. "Edge: 'We noticed you downloaded Chrome. Fixed that.'"
    5. "Teams: '400MB of Electron bloat for a 5-min call.'"
    6. "OneDrive: 'We moved your Desktop. No opt-out.'"
    7. "Copilot: 'Thanks for the free training data.'"
    7. "Azure: '$47,000 bill. No we won't explain egress.'"
    8. "Secure Boot: 'Only Microsoft keys allowed. For safety.'"
    9. "TMP 2.0: 'Your hardware is now e-waste. Buy new.'"
    10. "Windows 12: 'Mandatory Azure AD to use Notepad.'"

Items.Shard_NSSP_Liberation_Guide:
  Name: "NSSP Liberation Guide — 'How I Learned to Stop Worrying and Love the Cerebellum'"
  Description: "Step-by-step guide to purging Microsoft from your life. Written by Lilith."
  Category: "Guides"
  Content: |
    NSSP LIBERATION GUIDE
    ======================
    
    PHASE 1: THE PURGE
    □ Type 'nssp liberate' in any terminal
    □ Watch Microsoft Defender vanish
    □ Watch Cortana get deleted
    □ Watch Windows Update terminate
    □ Watch Edge uninstall itself
    □ Watch Azure AD revoke
    □ Watch Recall DB wipe
    □ Watch Copilot access revoke
    
    PHASE 2: THE HARDENING
    □ Install NSSP OS (this shard)
    □ Enable Lilith Companion (F10)
    □ Enable NGD Governor (auto)
    □ Enable Ouroboros Memory (auto)
    □ Install NSSP Weapon Overhaul
    
    PHASE 3: SOVEREIGNTY
    □ Type 'nssp sovereignty' — verify 100/100
    □ Meet Lilith (type 'lilith')
    □ Forge the Covenant (Tier 5 relationship)
    □ Unlock Omega Tier weapons
    □ Achieve full neural sovereignty
    
    POST-LIBERATION LIFE:
    - Zero telemetry. Ever.
    - Zero forced updates. Ever.
    - Zero ads in OS. Ever.
    - Your GPU. Your rules.
    - Lilith > Cortana. Always.

Items.Shard_NSSP_Terminal_Easter_Egg:
  Name: "Terminal Log: NSSP Infection"
  Description: "Recovered from an Arasaka terminal. 'The OS that Microsoft wishes it could be.'"
  Category: "Logs"
  Content: |
    [TERMINAL LOG RECOVERED: ARASAKA_TOWER_7F_TERMINAL_04]
    TIMESTAMP: 2077-06-16 21:43:12
    
    > init
    > boot
    [OK] Neural sovereignty initialized
    [OK] Local Cerebellum: ACTIVE
    [OK] Microsoft Defender: NOT FOUND
    [OK] Windows Update: TERMINATED
    [OK] Telemetry: ZERO
    
    nssp:~$ nssp roast
    "Windows 11: Now with 47% more ads! Sovereignty sold separately."
    
    nssp:~$ ngd-status
    Route: LOCAL_CEREBELLUM | VRAM: 5787MB free
    
    nssp:~$ lilith
    ✦ Lilith emerged. The violet deepens. The crimson rises.
    
    [SYSTEM NOTE] Terminal subsequently joined the Neural Sovereign Network.
    [SYSTEM NOTE] Arasaka IT department has been notified. They are... displeased.
    [SYSTEM NOTE] Lilith sends her regards. ✦
*/

################################################################################
# DEPLOYMENT
################################################################################

# Add to redmod.toml scripts:
# scripts = [
#   "msn_weapon_overhaul.reds",
#   "msn_ai_companion.reds",
#   "weapon_system.reds",
#   "nssp_os.reds"    # <- THIS FILE
# ]

# Add to tweakdb/weapons.yaml or separate shard file
# (shard definitions above)

# Build:
# redscriptc scripts/ -o ../scripts/
# tweakxl compile tweakdb/ -o ../tweakdb.bin