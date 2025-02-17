
{{- define "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.fullname" -}}
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


{{- define "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.labels" -}}
helm.sh/chart: {{ include "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.chart" . }}
{{ include "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8ea60623-1031-40b4-9200-ef70e6ff14ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}