
{{- define "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.fullname" -}}
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


{{- define "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.labels" -}}
helm.sh/chart: {{ include "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.chart" . }}
{{ include "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41f24db2-7cbe-4ee1-82d2-42608a1a1fa2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}