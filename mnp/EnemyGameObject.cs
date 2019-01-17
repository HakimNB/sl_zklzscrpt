using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

namespace MAP.COMBAT
{
    public class EnemyGameObject : MonoBehaviour
    {
#pragma warning disable 649

        [SerializeField]
        private MAP.CORE.Monster_Data m_monsterData;

        [SerializeField]
        private MAP.CORE.Hero_Base_Skill m_heroSkill;

#pragma warning restore 649

        public PlayableDirector m_playableDirector;

        public float m_column;
        public int m_row;

        private EnemyUI m_enemyUI;
        private int m_curTurn = 3;
        private int m_attackCoolDown = 5;
        private int m_prevHealth;
        // Start is called before the first frame update

        void Start()
        {
            m_monsterData.OnValidate();
            m_monsterData.BaseData.HeroSkill_Base_Data.LoadSkillData(m_monsterData.BaseData.Skill_ID);
            m_heroSkill.Initialize(m_monsterData.BaseData.HeroSkill_Base_Data);
            
            m_curTurn = Random.Range(1, m_attackCoolDown);
        }

        // Update is called once per frame
        void Update()
        {

        }

        public void OnTurnStart()
        {
            PreBuffStep();

            Debug.Log("monster TURN_START");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.TURN_START);

            --m_curTurn;
            m_enemyUI.SetTurnCounter(m_curTurn);

            ApplyBuffStep();

            PostBuffStep();
        }

        public void OnTurnEnd()
        {
            PreBuffStep();

            Debug.Log("monster TURN_END");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.TURN_END);

            if (m_curTurn == 0)
            {
                m_curTurn = m_attackCoolDown;
                m_enemyUI.SetTurnCounter(m_curTurn);

            }
            // gain mana every turn
            m_monsterData.Current_Mana = System.Math.Min(m_monsterData.Current_Mana + (int)m_monsterData.BaseData.Mana_Regen, m_monsterData.BaseData.MaxMana);
            m_enemyUI.SetMana(m_monsterData.Current_Mana, m_monsterData.BaseData.MaxMana);

            ApplyBuffStep();

            PostBuffStep();
        }
        
        public void OnAttack(HeroGameObject _hero)
        {
            PreBuffStep();

            Debug.Log("monster ON_ATTACK");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.ON_ATTACK);

            m_playableDirector.Play();
            _hero.TakeDamage(m_monsterData.Current_Attack);

            ApplyBuffStep();

            PostBuffStep();
        }

        public void CastSkill(HeroGameObject _target, CombatSkillsHelper _skillHelper)
        {
            PreBuffStep();
            
            m_enemyUI.SetMana(m_monsterData.Current_Mana, m_monsterData.BaseData.MaxMana);

            _skillHelper.SetCaster(this);
            _skillHelper.SetTarget(_target);

            m_heroSkill.ProcessBuffOn_Start(m_monsterData, _skillHelper);

            OnPreSkill();

            ApplyBuffStep();

            PostBuffStep();
        }
        
        /// <summary>
        /// when the monster casts a skill
        /// </summary>
        public void OnPreSkill()
        {
            PreBuffStep();

            Debug.Log("monster PRE_SKILL");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.PRE_SKILL);

            PostBuffStep();
        }

        public int GetTurnCounter()
        {
            return m_curTurn;
        }

        public void SetEnemyUI(EnemyUI _enemyUI)
        {
            m_enemyUI = _enemyUI;
            m_enemyUI.SetElement(m_monsterData.BaseData.Monster_Element);
            m_enemyUI.SetTurnCounter(m_curTurn);
            m_enemyUI.SetHealth(m_monsterData.Current_HP, m_monsterData.Max_HP);
            m_enemyUI.SetMana(0, m_monsterData.BaseData.MaxMana);
            // TODO check if monster data has skill
            m_enemyUI.SetHasMana(true);
            m_enemyUI.AttachToTransform(this.transform, new Vector3(0, 1.0f + 0.25f * m_row, 0));
        }

        public void RemoveEnemy(CombatUIManager _UIManager)
        {
            _UIManager.ReturnEnemyLifeBar(m_enemyUI);
            gameObject.SetActive(false);
        }

        public void TakeDamage(int damage)
        {
            m_monsterData.Current_HP = System.Math.Max(m_monsterData.Current_HP - damage, 0);
            if (m_monsterData.Current_HP > m_monsterData.Max_HP)
            {
                m_monsterData.Current_HP = m_monsterData.Max_HP;
            }
            m_enemyUI.SetHealth(m_monsterData.Current_HP, m_monsterData.Max_HP);

            m_monsterData.Current_Mana = System.Math.Min(m_monsterData.Current_Mana + (int)m_monsterData.BaseData.Mana_Regen, m_monsterData.BaseData.MaxMana);
            m_enemyUI.SetMana(m_monsterData.Current_Mana, m_monsterData.BaseData.MaxMana);
        }

        public bool IsDead()
        {
            return m_monsterData.Current_HP <= 0;
        }

        public int GetMonsterSize()
        {
            return m_monsterData.BaseData.Monster_Size;
        }

        public MAP.CORE.Element GetMonsterElement()
        {
            return m_monsterData.BaseData.Monster_Element;
        }

        public bool IsManaFull()
        {
            return m_monsterData.Current_Mana >= m_monsterData.BaseData.MaxMana;
        }

        public MAP.CORE.IBuffableStatObject GetBuffableStatObject()
        {
            return m_monsterData;
        }

        /// <summary>
        /// for updating UI after buff applies
        /// </summary>
        private void PreBuffStep()
        {
            m_prevHealth = m_monsterData.Current_HP;
        }

        private void ApplyBuffStep()
        {
            if (m_monsterData.DamageBuff != 0)
            {
                TakeDamage(m_monsterData.DamageBuff);
            }
            if (m_monsterData.HealthBuff != 0)
            {
                TakeDamage(-m_monsterData.HealthBuff);
            }
            m_monsterData.DamageBuff = 0;
            m_monsterData.HealthBuff = 0;
        }

        /// <summary>
        /// for updating UI after buff applies
        /// </summary>
        private void PostBuffStep()
        {
            if (m_prevHealth != m_monsterData.Current_HP)
            {
                m_enemyUI.SetHealth(m_monsterData.Current_HP, m_monsterData.Max_HP);
            }
        }

    }
}
