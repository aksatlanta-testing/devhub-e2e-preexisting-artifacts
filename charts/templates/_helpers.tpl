
{{- define "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.fullname" -}}
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


{{- define "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.labels" -}}
helm.sh/chart: {{ include "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.chart" . }}
{{ include "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo89bdd5bf-0a58-4070-9df2-22900152a6ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}