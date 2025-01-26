
{{- define "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.fullname" -}}
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


{{- define "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.labels" -}}
helm.sh/chart: {{ include "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.chart" . }}
{{ include "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo695a0126-45e7-4520-a03e-4d08cf0c9692.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}