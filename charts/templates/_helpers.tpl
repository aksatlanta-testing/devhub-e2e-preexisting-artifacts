
{{- define "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.labels" -}}
helm.sh/chart: {{ include "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.chart" . }}
{{ include "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3cd9c7d9-9a30-44c2-b2ec-0ac0f12d78cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}