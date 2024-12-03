
{{- define "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.fullname" -}}
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


{{- define "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.labels" -}}
helm.sh/chart: {{ include "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.chart" . }}
{{ include "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c2a7ac0-715e-45e0-87de-f97fa7512926.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}