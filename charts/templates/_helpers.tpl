
{{- define "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.fullname" -}}
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


{{- define "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.labels" -}}
helm.sh/chart: {{ include "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.chart" . }}
{{ include "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo91fcf2bf-a94b-4c27-8cc2-42ccfbf302fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}