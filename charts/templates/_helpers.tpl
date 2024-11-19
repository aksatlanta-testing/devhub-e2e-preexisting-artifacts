
{{- define "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.fullname" -}}
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


{{- define "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.labels" -}}
helm.sh/chart: {{ include "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.chart" . }}
{{ include "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo36af3aef-2f15-4830-867b-13b5d3f71edc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}