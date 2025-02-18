
{{- define "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.fullname" -}}
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


{{- define "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.labels" -}}
helm.sh/chart: {{ include "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.chart" . }}
{{ include "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52c171bf-2429-4b11-99a2-11192a0d082d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}