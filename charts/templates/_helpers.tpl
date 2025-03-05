
{{- define "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.fullname" -}}
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


{{- define "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.labels" -}}
helm.sh/chart: {{ include "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.chart" . }}
{{ include "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo00c1864b-e7eb-46ad-a060-89680a67c1af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}